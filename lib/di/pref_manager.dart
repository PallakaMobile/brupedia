import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  String kIsLogin = "isLogin";

  SharedPreferences preferences;

  PrefManager(this.preferences);

  //for Bloc.Bloc.login
  setIsLogin(bool value) {
    preferences.setBool("isLogin", value);
  }

  bool getIsLogin() =>
      preferences.containsKey(kIsLogin) ? preferences.getBool(kIsLogin) : false;

  logout() => preferences.clear();
}
