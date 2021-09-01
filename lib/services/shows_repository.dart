import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/services/api_client.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';
import 'package:infinum_academy_android_flutter/extensions/nullable_int_extension.dart';
import 'package:infinum_academy_android_flutter/services/shows_database.dart';

/// [ShowsRepository] singleton provider
final showsRepositoryProvider = Provider((ref) => ShowsRepository());

/// Used to easily work with shows data
/// Encapsulates [ApiClient] and [ShowsDatabase] for easy offline/online handling
class ShowsRepository {
  late final ApiClient _apiClient;
  late final SharedPreferences _prefs;

  Future<void> init(ApiClient apiClient) async {
    _apiClient = apiClient;
    _prefs = await SharedPreferences.getInstance();
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
}
