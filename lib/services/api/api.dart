import 'package:flutter/material.dart';

import '../../models/error_response.dart';

abstract class Api {
  Future login({@required String email, @required String password});

  Future getUsers();

  ErrorResponse parseError(response);
}
