import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/services/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = Provider((ref) => AuthenticationClient());

class AuthenticationClient {
  late ApiClient _apiClient;

  set apiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<String?> register(String email, String password, String confirmationPassword) async {
    try {
      final response = await _apiClient.register(email.trim(), password.trim(), confirmationPassword.trim());

      if (300 > (response.statusCode ?? 400) && (response.statusCode ?? 400) >= 200) {
        return null;
      }
    } on DioError catch (error) {
      try {
        return error.response?.data['errors'][0].toString();
      } catch (e) {
        return 'Something went wrong';
      }
    }
    return 'Something went wrong';
  }

  Future<String?> login(String email, String password, {required bool isRememberMeChecked}) async {
    try {
      final response = await _apiClient.login(email.trim(), password.trim());

      if (300 > (response.statusCode ?? 400) && (response.statusCode ?? 400) >= 200) {
        final prefs = await SharedPreferences.getInstance();

        prefs.setString(prefsEmailKey, response.data['user']['email'].toString());
        prefs.setString(prefsProfilePhotoUrlKey, response.data['user']['image_url'].toString());
        prefs.setBool(prefsRememberMeKey, isRememberMeChecked);

        prefs.setString('access-token', response.headers.value('access-token') ?? '');
        prefs.setString('client', response.headers.value('client') ?? '');
        prefs.setString('uid', response.headers.value('uid') ?? '');

        return null;
      }

      return 'Something went wrong';
    } on DioError catch (error) {
      try {
        return error.response?.data['errors'][0].toString();
      } catch (e) {
        return 'Something went wrong';
      }
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(prefsEmailKey);
    prefs.remove(prefsProfilePhotoUrlKey);
    prefs.remove(prefsRememberMeKey);

    prefs.remove('access-token');
    prefs.remove('client');
    prefs.remove('uid');
  }
}
