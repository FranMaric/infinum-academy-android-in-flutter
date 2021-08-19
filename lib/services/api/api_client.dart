import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiClientProvider = Provider((ref) => ApiClient());

class ApiClient {
  late Dio _dio;

  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://tv-shows.infinum.academy/',
        connectTimeout: 6000,
        receiveTimeout: 6000,
      ),
    );
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();

        options.headers.addAll(
          <String, String>{
            'access-token': prefs.getString('access-token') ?? '',
            'client': prefs.getString('client') ?? '',
            'uid': prefs.getString('uid') ?? '',
            'token-type': 'Bearer',
          },
        );
      },
    ));
  }
}
