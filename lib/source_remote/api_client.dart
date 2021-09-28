import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/common/models/new_review.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiClientProvider = Provider((ref) => ApiClient(ref.watch(sharedPreferencesProvider)));

class ApiClient {
  ApiClient(this._prefs) {
    _alice = Alice();
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://tv-shows.infinum.academy/',
        connectTimeout: 6000,
        receiveTimeout: 6000,
      ),
    );
    _dio.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) {
            /// Headers are not needed for login and register
            if (!['login', 'register'].contains(options.extra['type'])) {
              options.headers.addAll(
                <String, String>{
                  'access-token': _prefs.getString('access-token') ?? '',
                  'client': _prefs.getString('client') ?? '',
                  'uid': _prefs.getString('uid') ?? '',
                  'token-type': 'Bearer',
                },
              );
            }

            return handler.next(options);
          },
        ),
        _alice.getDioInterceptor()
      ],
    );
  }

  late final Dio _dio;
  late final Alice _alice;
  final SharedPreferences _prefs;

  Alice get alice => _alice;

  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<Response<dynamic>> register(String email, String password, String confirmationPassword) async {
    return _dio.post(
      '/users',
      data: {
        "email": email,
        "password": password,
        "password_confirmation": confirmationPassword,
      },
      options: Options(
        extra: {
          'type': 'register',
        },
      ),
    );
  }

  Future<Response<dynamic>> login(String email, String password) async {
    return _dio.post(
      '/users/sign_in',
      data: {
        "email": email,
        "password": password,
      },
      options: Options(
        extra: {
          'type': 'login',
        },
      ),
    );
  }

  Future<Response<dynamic>> getShows() async {
    return _dio.get('/shows');
  }

  Future<Response<dynamic>> getTopRatedShows() async {
    return _dio.get('/shows/top_rated');
  }

  Future<Response<dynamic>> uploadProfilePhoto(File imageFile) async {
    final fileName = imageFile.path.split('/').last;
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imageFile.path, filename: fileName),
    });

    return _dio.put('/users', data: formData);
  }

  Future<Response<dynamic>> getReviews(int showId) async {
    return _dio.get('/shows/$showId/reviews');
  }

  Future<Response<dynamic>> postReview(NewReview newReview) async {
    return _dio.post(
      '/reviews',
      data: newReview.toJson(),
    );
  }
}
