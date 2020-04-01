import 'dart:convert';

import 'package:meta/meta.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromMap(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  final bool success;
  final String message;
  final Data data;

  LoginResponse({
    @required this.success,
    @required this.message,
    @required this.data,
  });

  LoginResponse copyWith({
    bool success,
    String message,
    Data data,
  }) =>
      LoginResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final User user;
  final String role;
  final String token;

  Data({
    @required this.user,
    @required this.role,
    @required this.token,
  });

  Data copyWith({
    User user,
    String role,
    String token,
  }) =>
      Data(
        user: user ?? this.user,
        role: role ?? this.role,
        token: token ?? this.token,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: User.fromMap(json["user"]),
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "role": role,
        "token": token,
      };
}

class User {
  final int id;
  final String name;
  final int clientId;
  final String email;
  final dynamic genderLabel;
  final dynamic gender;
  final String mobile;
  final String codeCountry;
  final dynamic birthDate;
  final String avatar;
  final bool smsNotification;
  final bool isMobileVerified;
  final Otp otp;
  final ClientCity clientCity;
  final List<ClientLocation> clientLocations;

  User({
    @required this.id,
    @required this.name,
    @required this.clientId,
    @required this.email,
    @required this.genderLabel,
    @required this.gender,
    @required this.mobile,
    @required this.codeCountry,
    @required this.birthDate,
    @required this.avatar,
    @required this.smsNotification,
    @required this.isMobileVerified,
    @required this.otp,
    @required this.clientCity,
    @required this.clientLocations,
  });

  User copyWith({
    int id,
    String name,
    int clientId,
    String email,
    dynamic genderLabel,
    dynamic gender,
    String mobile,
    String codeCountry,
    dynamic birthDate,
    String avatar,
    bool smsNotification,
    bool isMobileVerified,
    Otp otp,
    ClientCity clientCity,
    List<ClientLocation> clientLocations,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        clientId: clientId ?? this.clientId,
        email: email ?? this.email,
        genderLabel: genderLabel ?? this.genderLabel,
        gender: gender ?? this.gender,
        mobile: mobile ?? this.mobile,
        codeCountry: codeCountry ?? this.codeCountry,
        birthDate: birthDate ?? this.birthDate,
        avatar: avatar ?? this.avatar,
        smsNotification: smsNotification ?? this.smsNotification,
        isMobileVerified: isMobileVerified ?? this.isMobileVerified,
        otp: otp ?? this.otp,
        clientCity: clientCity ?? this.clientCity,
        clientLocations: clientLocations ?? this.clientLocations,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        clientId: json["client_id"],
        email: json["email"],
        genderLabel: json["gender_label"],
        gender: json["gender"],
        mobile: json["mobile"],
        codeCountry: json["code_country"],
        birthDate: json["birth_date"],
        avatar: json["avatar"],
        smsNotification: json["sms_notification"],
        isMobileVerified: json["is_mobile_verified"],
        otp: Otp.fromMap(json["otp"]),
        clientCity: ClientCity.fromMap(json["client_city"]),
        clientLocations: List<ClientLocation>.from(
            json["client_locations"].map((x) => ClientLocation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "client_id": clientId,
        "email": email,
        "gender_label": genderLabel,
        "gender": gender,
        "mobile": mobile,
        "code_country": codeCountry,
        "birth_date": birthDate,
        "avatar": avatar,
        "sms_notification": smsNotification,
        "is_mobile_verified": isMobileVerified,
        "otp": otp.toMap(),
        "client_city": clientCity.toMap(),
        "client_locations":
            List<dynamic>.from(clientLocations.map((x) => x.toMap())),
      };
}

class ClientCity {
  final int id;
  final String nameAr;
  final String nameEn;
  final String name;
  final int status;
  final String statusLabel;
  final Country country;

  ClientCity({
    @required this.id,
    @required this.nameAr,
    @required this.nameEn,
    @required this.name,
    @required this.status,
    @required this.statusLabel,
    @required this.country,
  });

  ClientCity copyWith({
    int id,
    String nameAr,
    String nameEn,
    String name,
    int status,
    String statusLabel,
    Country country,
  }) =>
      ClientCity(
        id: id ?? this.id,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        name: name ?? this.name,
        status: status ?? this.status,
        statusLabel: statusLabel ?? this.statusLabel,
        country: country ?? this.country,
      );

  factory ClientCity.fromMap(Map<String, dynamic> json) => ClientCity(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        name: json["name"],
        status: json["status"],
        statusLabel: json["status_label"],
        country: Country.fromMap(json["country"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "name": name,
        "status": status,
        "status_label": statusLabel,
        "country": country.toMap(),
      };
}

class Country {
  final int id;
  final String name;
  final String codeCountry;
  final String avatar;
  final int status;
  final String statusLabel;

  Country({
    @required this.id,
    @required this.name,
    @required this.codeCountry,
    @required this.avatar,
    @required this.status,
    @required this.statusLabel,
  });

  Country copyWith({
    int id,
    String name,
    String codeCountry,
    String avatar,
    int status,
    String statusLabel,
  }) =>
      Country(
        id: id ?? this.id,
        name: name ?? this.name,
        codeCountry: codeCountry ?? this.codeCountry,
        avatar: avatar ?? this.avatar,
        status: status ?? this.status,
        statusLabel: statusLabel ?? this.statusLabel,
      );

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        codeCountry: json["code_country"],
        avatar: json["avatar"],
        status: json["status"],
        statusLabel: json["status_label"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "code_country": codeCountry,
        "avatar": avatar,
        "status": status,
        "status_label": statusLabel,
      };
}

class ClientLocation {
  final int id;
  final int clientId;
  final String latitude;
  final String longitude;
  final String address;
  final String addressAr;
  final String addressEn;
  final String buildingName;
  final int locationType;
  final String locationTypeLabel;
  final dynamic apartmentName;
  final bool requirePermission;
  final dynamic city;
  final dynamic zipCode;

  ClientLocation({
    @required this.id,
    @required this.clientId,
    @required this.latitude,
    @required this.longitude,
    @required this.address,
    @required this.addressAr,
    @required this.addressEn,
    @required this.buildingName,
    @required this.locationType,
    @required this.locationTypeLabel,
    @required this.apartmentName,
    @required this.requirePermission,
    @required this.city,
    @required this.zipCode,
  });

  ClientLocation copyWith({
    int id,
    int clientId,
    String latitude,
    String longitude,
    String address,
    String addressAr,
    String addressEn,
    String buildingName,
    int locationType,
    String locationTypeLabel,
    dynamic apartmentName,
    bool requirePermission,
    dynamic city,
    dynamic zipCode,
  }) =>
      ClientLocation(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        addressAr: addressAr ?? this.addressAr,
        addressEn: addressEn ?? this.addressEn,
        buildingName: buildingName ?? this.buildingName,
        locationType: locationType ?? this.locationType,
        locationTypeLabel: locationTypeLabel ?? this.locationTypeLabel,
        apartmentName: apartmentName ?? this.apartmentName,
        requirePermission: requirePermission ?? this.requirePermission,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
      );

  factory ClientLocation.fromMap(Map<String, dynamic> json) => ClientLocation(
        id: json["id"],
        clientId: json["client_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        addressAr: json["address_ar"],
        addressEn: json["address_en"],
        buildingName: json["building_name"],
        locationType: json["location_type"],
        locationTypeLabel: json["location_type_label"],
        apartmentName: json["apartment_name"],
        requirePermission: json["require_permission"],
        city: json["city"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "client_id": clientId,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "address_ar": addressAr,
        "address_en": addressEn,
        "building_name": buildingName,
        "location_type": locationType,
        "location_type_label": locationTypeLabel,
        "apartment_name": apartmentName,
        "require_permission": requirePermission,
        "city": city,
        "zip_code": zipCode,
      };
}

class Otp {
  final String otp;

  Otp({
    @required this.otp,
  });

  Otp copyWith({
    String otp,
  }) =>
      Otp(
        otp: otp ?? this.otp,
      );

  factory Otp.fromMap(Map<String, dynamic> json) => Otp(
        otp: json["otp"],
      );

  Map<String, dynamic> toMap() => {
        "otp": otp,
      };
}
