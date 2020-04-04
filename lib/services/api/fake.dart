import 'package:flutter/material.dart';

import '../../models/error_response.dart';
import '../../utils/logger.dart';
import 'api.dart';

class FakeApi implements Api {
  final logger = getLogger("Fake Api");

  FakeApi() {
    logger.i('Using Fake Api');
  }

  Future login({@required String email, @required String password}) async {
    return {'email': email, 'password': password};
  }

  Future getUsers() async {
    // return makeRestCall(RestType.GET, "users");
  }

  ErrorResponse parseError(response) {
    return errorResponseFromJson(response.body);
  }
}
