import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/models/user.dart';
import 'package:infinum_academy_android_flutter/services/api_client.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';
import 'package:infinum_academy_android_flutter/extensions/nullable_int_extension.dart';
import 'package:infinum_academy_android_flutter/services/shows_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [ShowsRepository] singleton provider
final showsRepositoryProvider = Provider((ref) => ShowsRepository());

/// Used to easily work with shows data
/// Encapsulates [ApiClient] and [ShowsDatabase] for easy offline/online handling
class ShowsRepository {
  late final ApiClient _apiClient;

  /// Call [init] as soon as possible
  Future<void> init(ApiClient apiClient) async {
    _apiClient = apiClient;
    _checkForOfflinePhotoUpload();
  }

  Future<List<Show>> getShows({required bool isTopRated}) async {
    try {
      final response = isTopRated ? await _apiClient.getTopRatedShows() : await _apiClient.getShows();

      if (response.statusCode.isSuccessful) {
        final shows = List<Map<String, dynamic>>.from(response.data['shows'] as List).map((show) => Show.fromJson(show)).toList();

        return shows;
      }
    } on DioError catch (dioError) {
      throw ShowsException.fromDioError(dioError);
    }
    return [];
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
}
