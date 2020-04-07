// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

User userFromJson(String str) => User.fromMap(json.decode(str));

String userToJson(User data) => json.encode(data.toMap());

class User extends Equatable {
  final String firstName;
  final String lastName;

  User({
    @required this.firstName,
    @required this.lastName,
  });

  User copyWith({
    String firstName,
    String lastName,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
      };

  @override
  List<Object> get props => [firstName, lastName];

  @override
  bool get stringify => true;
}
