import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'logger.dart';

class SecureStorageHelper {
  // Logger Head value
  final logger = getLogger("SecureStorageHelper()");

  // Secure Storage
  final _storage = FlutterSecureStorage();

  static const String _token_identifier = '_token_identifier';

  SecureStorageHelper() {
    logger.i("Constructed");
  }

  Future<String> getAuthToken() async {
    try {
      return await _storage.read(key: _token_identifier);
    } catch (error) {
      logger.e(error);
      throw error;
    }
  }

  Future<bool> setAuthToken(String token) async {
    try {
      await _storage.write(key: _token_identifier, value: token);
      return true;
    } catch (error) {
      logger.e(error);
      throw error;
    }
  }

  Future deleteAll() => _storage.deleteAll();
}
