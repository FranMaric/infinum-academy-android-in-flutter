import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/extensions/nullable_int_extension.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_preferences_provider.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/source_remote/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.watch(apiClientProvider), ref.watch(sharedPreferencesProvider)),
);

abstract class AuthRepository {
  Future<String?> register(String email, String password, String confirmationPassword);
  Future<String?> login(String email, String password, {required bool isRememberMeChecked});
  Future<bool> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiClient, this._prefs);

  final ApiClient _apiClient;
  final SharedPreferences _prefs;

  @override
  Future<String?> register(String email, String password, String confirmationPassword) async {
    try {
      final response = await _apiClient.register(email.trim(), password.trim(), confirmationPassword.trim());

      if (response.statusCode.isSuccessful) {
        return null;
      }
    } on DioError catch (error) {
      try {
        return error.response?.data['errors'][0].toString() ?? 'Something went wrong';
      } catch (e) {
        return 'Something went wrong';
      }
    }
    return 'Something went wrong';
  }

  @override
  Future<String?> login(String email, String password, {required bool isRememberMeChecked}) async {
    try {
      final response = await _apiClient.login(email.trim(), password.trim());

      if (response.statusCode.isSuccessful) {
        _prefs.setString(prefsEmailKey, response.data['user']['email'].toString());
        _prefs.setString(prefsProfilePhotoUrlKey, response.data['user']['image_url'].toString());
        _prefs.setBool(prefsRememberMeKey, isRememberMeChecked);

        _prefs.setString('access-token', response.headers.value('access-token') ?? '');
        _prefs.setString('client', response.headers.value('client') ?? '');
        _prefs.setString('uid', response.headers.value('uid') ?? '');

        return null;
      }

      return 'Something went wrong';
    } on DioError catch (error) {
      try {
        return error.response?.data['errors'][0].toString() ?? 'Something went wrong';
      } catch (e) {
        return 'Something went wrong';
      }
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await _prefs.remove(prefsEmailKey);
      await _prefs.remove(prefsProfilePhotoUrlKey);
      await _prefs.remove(prefsRememberMeKey);

      await _prefs.remove('access-token');
      await _prefs.remove('client');
      await _prefs.remove('uid');

      return true;
    } catch (e) {
      return false;
    }
  }
}
