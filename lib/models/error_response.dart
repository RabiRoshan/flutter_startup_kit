// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromMap(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toMap());

class ErrorResponse extends Equatable {
  final String error;

  ErrorResponse({
    @required this.error,
  });

  ErrorResponse copyWith({
    String error,
  }) =>
      ErrorResponse(
        error: error ?? this.error,
      );

  factory ErrorResponse.fromMap(Map<String, dynamic> json) => ErrorResponse(
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
      };

  @override
  List<Object> get props => [error];

  @override
  bool get stringify => true;
}
