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
            if (options.path != '/users' && options.path != '/users/sign_in') {
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

  Future<Response<dynamic>> register(String email, String password, String confirmationPassword) async {
    return _dio.post(
      '/users',
      data: {
        "email": email,
        "password": password,
        "password_confirmation": confirmationPassword,
      },
    );
  }

  Future<Response<dynamic>> login(String email, String password) async {
    return _dio.post(
      '/users/sign_in',
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
