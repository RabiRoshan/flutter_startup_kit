import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

import '../locator.dart';
import '../models/login_response.dart';
import '../utils/logger.dart';
import 'api.dart';

enum AuthProblems { UserNotFound, PasswordNotValid, NetworkError }

class AuthService with ChangeNotifier {
  BehaviorSubject<bool> isLoggedIn = BehaviorSubject();
  LoginResponse loginResponse;
  String authToken;
  static const String _token_identifier = '_token_identifier';

// Create storage
  final storage = new FlutterSecureStorage();

// Write value
  final log = getLogger("AuthService");

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

  // User getUser() {
  //   return User(name: "test", email: "test@test.com", username: "tester");
  // }

  Future<void> logout() async {
    this.loginResponse = null;
    isLoggedIn.add(false);
    // Delete all
    await storage.deleteAll();
  }

  Future login({String code}) {
    return getIt<Api>().login(code: code).then((response) async {
      final token = response.headers["x-token"];
      this.authToken = token;
      this.loginResponse = loginResponseFromJson(response.body);
      await storage.write(key: _token_identifier, value: token);
    });
  }

  void updateUserData(LoginResponse loginResponseFromJson) {
    this.loginResponse = loginResponseFromJson;
  }
}
