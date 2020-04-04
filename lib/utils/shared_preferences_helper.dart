import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class SharedPreferencesHelper {
  static const String _pref_user_data = "_pref_user_data";

  Future<User> getLocalUserData() async {
    var _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_pref_user_data) != null
        ? userFromJson(_prefs.getString(_pref_user_data))
        : Future.value(null);
  }

  Future<bool> setLocalUserData(User user) async {
    var _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(_pref_user_data, userToJson(user));
  }
}
