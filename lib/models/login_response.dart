import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  User user;
  String type;
  String authLevel;
  List<dynamic> allowedBusses;

  LoginResponse({
    this.user,
    this.type,
    this.authLevel,
    this.allowedBusses,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        type: json["type"] == null ? null : json["type"],
        authLevel: json["authLevel"] == null ? null : json["authLevel"],
        allowedBusses: json["allowedBusses"] == null
            ? null
            : List<dynamic>.from(json["allowedBusses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "type": type == null ? null : type,
        "authLevel": authLevel == null ? null : authLevel,
        "allowedBusses": allowedBusses == null
            ? null
            : List<dynamic>.from(allowedBusses.map((x) => x)),
      };
}

class User {
  String loginCode;
  String name;
  dynamic phone;

  User({
    this.loginCode,
    this.name,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        loginCode: json["loginCode"] == null ? null : json["loginCode"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "loginCode": loginCode == null ? null : loginCode,
        "name": name == null ? null : name,
        "phone": phone,
      };
}
