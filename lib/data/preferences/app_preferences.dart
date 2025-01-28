import 'package:get_storage/get_storage.dart';
const String _appEnvironment = "app_environment";
const String _apiToken = "api_token";
const String _authenticationData = "authentication_data";

class AppPreferences {
  /// Set App Environment
  static setAppEnvKey(String value) => GetStorage().write(_appEnvironment, value);

  /// Get App Environment
  static get getAppEnvKey => GetStorage().read<String>(_appEnvironment);

  /// Remove App Environment
  static removeAppEnvKey() => GetStorage().remove(_appEnvironment);

  /// Set Api Token
  static setApiToken(String value) => GetStorage().write(_apiToken, value);

  /// Get Api Token
  static get getApiToken => GetStorage().read<String>(_apiToken);

  /// Remove Api Token
  static removeApiToken() => GetStorage().remove(_apiToken);

  /// Set Authentication Data
  static setAuthenticationData(String value) => GetStorage().write(_authenticationData, value);

  /// Get Authentication Data
  static get getAuthenticationData => GetStorage().read<String>(_authenticationData);

  /// Remove Authentication Data
  static removeAuthenticationData() => GetStorage().remove(_authenticationData);


}
