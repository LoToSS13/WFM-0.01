import 'package:wfm_mobile_app/common/data_providers/profile_data_provider.dart';
import 'package:wfm_mobile_app/common/network/api_client.dart';

//Модель для определения какую страницу изначально загружать
class MyAppModel {
  final _profileDataProvider = ProfileDataProvider();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  //Проверка наличия и валидности refresh token
  Future<void> chechAuth() async {
    final accessToken = await _profileDataProvider.getAccessToken();
    if (accessToken != null) {
      _isAuth = true;
      try {
        await ApiClient().whoAmI();
      } catch (e) {
        _isAuth = false;
      }
    }
  }
}
