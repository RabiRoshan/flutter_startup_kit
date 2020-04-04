// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromMap(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  final String token;

  LoginResponse({
    @required this.token,
  });

  LoginResponse copyWith({
    String token,
  }) =>
      LoginResponse(
        token: token ?? this.token,
      );

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
