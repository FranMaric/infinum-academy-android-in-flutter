import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/services/api_client.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';

final showsRepositoryProvider = Provider((ref) => ShowsRepository());

class ShowsRepository {
  late ApiClient _apiClient;

  set apiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<List<Show>> getShows({required bool isTopRated}) async {
    try {
      final response = isTopRated ? await _apiClient.getTopRatedShows() : await _apiClient.getShows();

      if (300 > (response.statusCode ?? 400) && (response.statusCode ?? 400) >= 200) {
        final shows = List<Map<String, dynamic>>.from(response.data['shows'] as List).map((show) => Show.fromJson(show)).toList();

        return shows;
      }
    } on DioError catch (dioError) {
      throw ShowsException.fromDioError(dioError);
    }
    return [];
  }
}
