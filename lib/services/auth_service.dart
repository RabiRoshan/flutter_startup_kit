import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

import '../locator.dart';
import '../models/login_response.dart';
import '../utils/logger.dart';
import 'api/api.dart';

enum AuthProblems { UserNotFound, PasswordNotValid, NetworkError }

class AuthService with ChangeNotifier {
  BehaviorSubject<bool> isLoggedIn = BehaviorSubject();
  String authToken;

  static const String _token_identifier = '_token_identifier';

  // Create storage
  final storage = FlutterSecureStorage();

  // Logger Head value
  final logger = getLogger("AuthService");

  AuthService() {
    _init();
  }

  _init() async {
    this.authToken = await storage.read(key: _token_identifier);
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

      await storage.write(key: _token_identifier, value: res.token);
    });
  }
}
