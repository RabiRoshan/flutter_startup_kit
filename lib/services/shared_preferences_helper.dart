import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _pref_user_data = "_pref_user_data";

  Future<bool> hasUserDataCommited() async {
    var _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(_pref_user_data) ?? Future.value(false);
  }

  Future<bool> setUserDataCommited(bool commited) async {
    var _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(_pref_user_data, commited);
  }
}
