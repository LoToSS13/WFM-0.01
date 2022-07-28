import 'dart:convert';

import 'dart:io';

import 'package:wfm_mobile_app/common/constants/api.dart';
import 'package:wfm_mobile_app/common/data_providers/profile_data_provider.dart';

class ApiClient {
  final _client = HttpClient();
  final _baseUrl = WfmApi.baseURL;
  final _login = WfmApi.login;
  final _relogin = WfmApi.relogin;
  final _whoAmI = WfmApi.whoAmI;

  Future<Map<String, String>> login(
      {required String login, required String password}) async {
    final url = Uri.parse('$_baseUrl$_login');
    final parameters = <String, dynamic>{
      'login': login,
      'password': password,
    };
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final tokens = {
      'access_token': json['data']['access_token'] as String,
      'refresh_token': json['data']['refresh_token'] as String
    };

    return tokens;
  }

  Future<Map<String, dynamic>> relogin({required String refreshToken}) async {
    final url = Uri.parse('$_baseUrl$_relogin');
    final parameters = <String, dynamic>{
      'refresh_token': refreshToken,
    };
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final tokens = {
      'access_token': json['data']['access_token'] as String,
      'refresh_token': json['data']['refresh_token'] as String
    };
    return tokens;
  }

  Future<Map<String, dynamic>> whoAmI() async {
    final url = Uri.parse('$_baseUrl$_whoAmI');
    final accessToken = await ProfileDataProvider().getAccessToken();

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.headers.set('Authorization', 'Bearer $accessToken');

    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final data = json['data'];
    return data;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
