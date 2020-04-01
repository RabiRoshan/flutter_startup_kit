import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../locator.dart';
import '../models/error_response.dart';
import '../utils/logger.dart';
import 'auth_service.dart';

class Api {
  final String _baseUrl = "/";
  final logger = getLogger("Api");

  Future<http.Response> login(
      {@required String email, @required String password}) async {
    return _makeRestCall(RestType.POST, "login",
        payload: {"email": email, "password": password});
  }

  Future<http.Response> getUsers() async {
    return _makeRestCall(RestType.GET, "users");
  }

  ErrorResponse _parseError(http.Response response) {
    return errorResponseFromJson(response.body);
  }

  Future<http.Response> _makeRestCall(
    RestType eventType,
    String endpoint, {
    Map payload, // POST or PUT body
    Map queryParameters, // GET query body
  }) async {
    String url = "$_baseUrl$endpoint";
    final headers = {
      "Content-Type": "application/json",
      "auth": "Bearer ${getIt<AuthService>().authToken}"
    };

    try {
      http.Response response;
      switch (eventType) {
        case RestType.GET:
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
        case RestType.POST:
          response = await http.post(url,
              headers: headers, body: json.encode(payload));
          break;
        case RestType.PUT:
          response =
              await http.put(url, headers: headers, body: json.encode(payload));
          break;
        case RestType.PATCH:
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
  GET,
  PATCH,
  POST,
  PUT,
}
