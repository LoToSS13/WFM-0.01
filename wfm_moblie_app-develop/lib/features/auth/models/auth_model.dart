import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/data_providers/profile_data_provider.dart';
import 'package:wfm_mobile_app/common/network/api_client.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _profileDataProvider = ProfileDataProvider();

  final TextEditingController? loginTextController = TextEditingController();
  final TextEditingController? passwordTextController = TextEditingController();

  String? _errorMassage;
  String? get errorMassage => _errorMassage;

  bool isAuth = false;
  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth() async {
    print("Sending request");
    final login = loginTextController?.text;
    final password = passwordTextController?.text;

    // Проверяю ввёл ли что-то пользователь
    if (login!.isEmpty || password!.isEmpty) {
      _errorMassage = 'Please entry login and password';
      notifyListeners();
      return;
    }

    _errorMassage = null;
    _isAuthProgress = true;

    notifyListeners();

    Map<String, dynamic>? tokens;

    // Login
    try {
      tokens = await _apiClient.login(login: login, password: password);
    } catch (e) {
      _errorMassage = 'Wrong login or password';
    }
    _isAuthProgress = false;
    if (_errorMassage != null) {
      notifyListeners();
      return;
    }

    // Saving tokens
    final accessToken = tokens?['access_token'];
    final refreshToken = tokens?['refresh_token'];

    await _profileDataProvider.setAccessToken(accessToken);
    await _profileDataProvider.setRefreshToken(refreshToken);

    Map<String, dynamic>? data;

    _errorMassage = null;

    _isAuthProgress = true;
    try {
      data = await _apiClient.whoAmI();
    } catch (e) {
      _errorMassage = 'Trying to reconnect, please wait...';
    }

    if (_errorMassage != null) {
      notifyListeners();
      tokens = await _apiClient.relogin(
          refreshToken: _profileDataProvider.getRefreshToken().toString());
    }

    _errorMassage = null;

    try {
      data = await _apiClient.whoAmI();
    } catch (e) {
      _errorMassage = 'Something went wrong please log in again';
    }
    if (_errorMassage != null) {
      notifyListeners();
      return;
    }

    final id = data?['id'];
    final userLogin = data?['login'];

    await _profileDataProvider.setId(id);
    await _profileDataProvider.setLogin(userLogin);
    isAuth = true;
  }
}
