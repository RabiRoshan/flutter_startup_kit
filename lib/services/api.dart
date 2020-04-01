import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../locator.dart';
import '../models/error_response.dart';
import '../utils/logger.dart';
import 'auth_service.dart';

class Api {
  final String _baseUrl = "";
  final logger = getLogger("Api");

  Future<http.Response> login({@required String code}) async {
    try {
      final body = jsonEncode({"code": code});

      final response = await http
          .post("${_baseUrl}login",
              headers: {"Content-Type": "application/json"}, body: body)
          .catchError((error) {
        logger.i("error: ${error.message}");

        return error;
      });
      logger.i("response: $response");
      if (response.statusCode != 200) {
        return Future.error(_parseError(response));
      }
      return response;
    } catch (error) {
      logger.e("$error");
      return Future.error("Something went wrong");
    }
  }

  ErrorResponse _parseError(http.Response response) {
    return errorResponseFromJson(response.body);
  }

  Future<http.Response> submitUserData(
      {String name, String phoneNumber}) async {
    final payload = {
      "name": name,
      "phone": "+43$phoneNumber",
    };
    return _makeRestCall(RestType.patch, "users", payload: payload);
  }

  Future<http.Response> getUser() async {
    return _makeRestCall(RestType.patch, "users", payload: {});
  }

  Future<http.Response> _makeRestCall(RestType eventType, String endpoint,
      {Map payload, Map queryParameters}) async {
    String url = "$_baseUrl$endpoint";
    final headers = {
      "Content-Type": "application/json",
      "auth": "Bearer ${getIt<AuthService>().authToken}"
    };

    try {
      http.Response response;
      switch (eventType) {
        case RestType.get:
          if (queryParameters != null) {
            url = "$url?";
            queryParameters.forEach((key, value) {
              url = "$url$key=$value";
            });
          }
          response = await http.get(
            url,
            headers: headers,
          );
          break;
        case RestType.post:
          response = await http.post(url,
              headers: headers, body: json.encode(payload));
          break;
        case RestType.put:
          response =
              await http.put(url, headers: headers, body: json.encode(payload));
          break;
        case RestType.patch:
          response = await http.patch(url,
              headers: headers, body: jsonEncode(payload));
          break;
        default:
      }
      logger.i("${eventType.toString()} call: $url");

      logger.i("response: ${response.body}");
      if (response.statusCode != 200) {
        return Future.error(_parseError(response));
      }
      return response;
    } catch (error) {
      logger.e("error: ${error.message}");
      return error;
    }
  }
}

enum RestType {
  get,
  patch,
  post,
  put,
}
