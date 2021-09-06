import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiClientProvider = Provider((ref) => ApiClient());

class ApiClient {
  late Dio _dio;

  void init(Alice alice) {
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
          onRequest: (options, handler) async {
            /// Headers are not needed for login and register
            if (!['login', 'register'].contains(options.extra['type'])) {
              final prefs = await SharedPreferences.getInstance();

              options.headers.addAll(
                <String, String>{
                  'access-token': prefs.getString('access-token') ?? '',
                  'client': prefs.getString('client') ?? '',
                  'uid': prefs.getString('uid') ?? '',
                  'token-type': 'Bearer',
                },
              );
            }

            return handler.next(options);
          },
        ),
        alice.getDioInterceptor()
      ],
    );
  }

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
}
