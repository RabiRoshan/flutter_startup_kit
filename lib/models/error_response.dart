import 'dart:convert';

import 'package:meta/meta.dart';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromMap(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toMap());

class ErrorResponse {
  final bool success;
  final String message;
  final int errorCode;

  ErrorResponse({
    @required this.success,
    @required this.message,
    @required this.errorCode,
  });

  ErrorResponse copyWith({
    bool success,
    String message,
    int errorCode,
  }) =>
      ErrorResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        errorCode: errorCode ?? this.errorCode,
      );

  factory ErrorResponse.fromMap(Map<String, dynamic> json) => ErrorResponse(
        success: json["success"],
        message: json["message"],
        errorCode: json["error_code"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "error_code": errorCode,
      };
}
