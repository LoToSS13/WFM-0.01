import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _Keys {
  static const refreshToken = 'refresh_token';
  static const accessToken = 'access_token';
  static const name = 'name';
  static const id = 'id';
  static const login = 'login';
}

class ProfileDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getRefreshToken() =>
      _secureStorage.read(key: _Keys.refreshToken);
  Future<void> setRefreshToken(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.refreshToken, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.refreshToken);
    }
  }

  Future<String?> getAccessToken() =>
      _secureStorage.read(key: _Keys.accessToken);
  Future<void> setAccessToken(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.accessToken, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.accessToken);
    }
  }

  Future<String?> getName() => _secureStorage.read(key: _Keys.name);
  Future<void> setName(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.name, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.name);
    }
  }

  Future<String?> getId() => _secureStorage.read(key: _Keys.id);
  Future<void> setId(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.id, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.id);
    }
  }

  Future<String?> getLogin() => _secureStorage.read(key: _Keys.login);
  Future<void> setLogin(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.login, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.login);
    }
  }
}
