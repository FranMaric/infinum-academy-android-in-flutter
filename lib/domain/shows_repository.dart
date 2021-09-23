import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/source_local/mapper/db_review_mapper.dart';
import 'package:infinum_academy_android_flutter/source_local/mapper/db_show_mapper.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/common/models/new_review.dart';
import 'package:infinum_academy_android_flutter/common/models/review.dart' show Review;
import 'package:infinum_academy_android_flutter/common/models/show.dart';
import 'package:infinum_academy_android_flutter/common/models/user.dart';
import 'package:infinum_academy_android_flutter/source_remote/api_client.dart';
import 'package:infinum_academy_android_flutter/domain/shows_exception.dart';
import 'package:infinum_academy_android_flutter/extensions/nullable_int_extension.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';
import 'package:infinum_academy_android_flutter/source_remote/mapper/review_mapper.dart';
import 'package:infinum_academy_android_flutter/source_remote/mapper/show_mapper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [ShowsRepository] singleton provider
final showsRepositoryProvider = Provider((ref) => ShowsRepository());

/// Used to easily work with shows data
/// Encapsulates [ApiClient] and [ShowsDatabase] for easy offline/online handling
class ShowsRepository {
  late final ApiClient _apiClient;
  late final ShowsDatabase _database;

  /// Call [init] as soon as possible
  Future<void> init(ApiClient apiClient, ShowsDatabase database) async {
    _apiClient = apiClient;
    _database = database;
    _checkForOfflinePhotoUpload();
    _chcekForOfflineReviews();
  }

  Future<List<Show>> getShows({required bool isTopRated}) async {
    try {
      final hasInternetConnection = await _apiClient.hasInternetConnection();

      if (!hasInternetConnection) {
        if (isTopRated) {
          return [];
        }

        return _getShowsFromDB();
      }

      final response = isTopRated ? await _apiClient.getTopRatedShows() : await _apiClient.getShows();

      if (response.statusCode.isSuccessful) {
        final shows = List<Map<String, dynamic>>.from(response.data['shows'] as List).map((show) => Show.fromJson(show)).toList();

        if (!isTopRated) {
          _addShowsToDB(shows);
        }

        return shows;
      }
    } on DioError catch (dioError) {
      throw ShowsException.fromDioError(dioError);
    }

    return _getShowsFromDB();
  }

  Future<List<Show>> _getShowsFromDB() async {
    final dbShows = await _database.showDao.getAllShows();

    return ShowMapper.mapFromListOfDBShow(dbShows);
  }

  Future<void> _addShowsToDB(List<Show> shows) async {
    _database.showDao.addShows(DBShowMapper.mapFromListOfShow(shows));
  }

  Future<List<Review>> getReviews({required int showId}) async {
    try {
      final hasInternetConnection = await _apiClient.hasInternetConnection();

      if (!hasInternetConnection) {
        return _getReviewsFromDB(showId);
      }

      final response = await _apiClient.getReviews(showId);

      if (response.statusCode.isSuccessful) {
        final reviews = List<Map<String, dynamic>>.from(response.data['reviews'] as List).map((review) => Review.fromJson(review)).toList();

        _addReviewsToDB(reviews);

        return reviews;
      }
    } on DioError catch (dioError) {
      throw ShowsException.fromDioError(dioError);
    }

    return _getReviewsFromDB(showId);
  }

  Future<List<Review>> _getReviewsFromDB(int showId) async {
    final dbReviews = await _database.reviewDao.getReviews(showId);

    return ReviewMapper.mapFromListOfDBReviews(dbReviews);
  }

  Future<void> _addReviewsToDB(List<Review> reviews) async {
    _database.reviewDao.addReviews(DBReviewMapper.mapFromListOfReviews(reviews));
  }

  Future<void> uploadProfilePhoto(File tempFile) async {
    try {
      final hasInternetConnection = await _apiClient.hasInternetConnection();

      if (hasInternetConnection) {
        final response = await _apiClient.uploadProfilePhoto(tempFile);

        if (response.statusCode.isSuccessful) {
          final user = User.fromJson(response.data['user'] as Map<String, dynamic>);

          if (user.imageUrl != null) {
            await _setPrefsProfilePhotoUrl(user.imageUrl!);
          }
          return;
        }
      }
    } on DioError catch (dioError) {
      throw ShowsException.fromDioError(dioError);
    }

    await _saveProfilePhotoLocally(tempFile);
  }

  Future<void> _saveProfilePhotoLocally(File tempFile) async {
    try {
      final path = (await getApplicationDocumentsDirectory()).path;
      final fullPath = '$path/profile_photo.png';

      final file = File(fullPath);
      if (await file.exists()) {
        await file.delete();
      }

      await tempFile.copy(fullPath);
      await _setPrefsProfilePhotoUrl(fullPath);
    } catch (e) {
      throw ShowsException('Save profile photo locally error: ${e.toString()}');
    }
  }

  Future<void> _setPrefsProfilePhotoUrl(String profilePhotoUrl) async {
    final prefs = await SharedPreferences.getInstance();
    final hasSetPrefsProfilePhotoUrl = await prefs.setString(prefsProfilePhotoUrlKey, profilePhotoUrl);

    if (!hasSetPrefsProfilePhotoUrl) {
      throw ShowsException("Couldn't set profile photo url to prefs");
    }
  }

  Future<void> _checkForOfflinePhotoUpload() async {
    final prefs = await SharedPreferences.getInstance();
    final url = prefs.getString(prefsProfilePhotoUrlKey);

    if (url == null) {
      return;
    }

    final hasInternetConnection = await _apiClient.hasInternetConnection();

    if (!url.startsWith('http') && hasInternetConnection) {
      try {
        final file = File(url);
        uploadProfilePhoto(file);
      } catch (_) {}
    }
  }

  Future<void> postReview(Review review) async {
    try {
      final hasInternetConnection = await _apiClient.hasInternetConnection();

      if (!hasInternetConnection) {
        return _saveNewReviewToDB(review);
      }

      final newReview = NewReview(
        rating: review.rating,
        comment: review.comment,
        showId: review.showId,
      );
      final response = await _apiClient.postReview(newReview);

      if (response.statusCode.isSuccessful) {
        return;
      }
    } on DioError catch (dioError) {
      throw ShowsException.fromDioError(dioError);
    }

    _saveNewReviewToDB(review);
  }

  void _saveNewReviewToDB(Review review) {
    _database.reviewDao.addReview(DBReviewMapper.mapFromReview(review));
  }

  Future<int> _chcekForOfflineReviews() async {
    final hasInternetConnection = await _apiClient.hasInternetConnection();

    if (!hasInternetConnection) {
      return 0;
    }

    final offlineReviews = await _database.reviewDao.getOfflineReviews();
    int count = 0;

    for (final offlineDBReview in offlineReviews) {
      final newReview = NewReview(
        rating: offlineDBReview.rating,
        comment: offlineDBReview.comment,
        showId: offlineDBReview.showId,
      );

      final response = await _apiClient.postReview(newReview);

      if (response.statusCode.isSuccessful) {
        await _database.reviewDao.deleteReview(offlineDBReview);

        final dbReview = DBReviewMapper.mapFromReview(
          Review.fromJson(response.data['review'] as Map<String, dynamic>),
        );
        await _database.reviewDao.addReview(dbReview);

        count++;
      }
    }

    return count;
  }
}
