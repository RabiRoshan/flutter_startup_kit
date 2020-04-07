import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../locator.dart';
import '../models/login_response.dart';
import '../utils/logger.dart';
import '../utils/secure_storage_helper.dart';
import 'api/api.dart';

enum AuthProblems { UserNotFound, PasswordNotValid, NetworkError }

class AuthService with ChangeNotifier {
  // Logger Head value
  final logger = getLogger("AuthService()");

  BehaviorSubject<bool> isLoggedIn = BehaviorSubject();
  String authToken;

  final storage = getIt<SecureStorageHelper>();

  AuthService() {
    _init();
  }

  _init() async {
    this.authToken = await storage.getAuthToken();
    logger.i("Constructed");
    if (authToken != null)
      isLoggedIn.add(true);
    else
      isLoggedIn.add(false);
  }

  Future<void> logout() async {
    isLoggedIn.add(false);
    // Delete all
    await storage.deleteAll();
  }

  Future login({String email, String password}) {
    return getIt<Api>()
        .login(email: email, password: password)
        .then((response) async {
      LoginResponse res = loginResponseFromJson(response.body);
      authToken = res.token;
      isLoggedIn.add(true);

      await storage.setAuthToken(authToken);
    });
  }
}
