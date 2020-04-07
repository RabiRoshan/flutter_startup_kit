import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../../models/error_response.dart';
import '../../utils/logger.dart';
import '../auth_service.dart';
import 'api.dart';

class HttpApi implements Api {
  final logger = getLogger("HttpApi()");

  final String _baseUrl = "https://reqres.in/api/";

  HttpApi() {
    logger.i('Constructed');
  }

  Future login({@required String email, @required String password}) async {
    return makeRestCall(RestType.POST, "login",
        payload: {"email": email, "password": password}, authenticated: false);
  }

  Future getUsers() async {
    return makeRestCall(RestType.GET, "users");
  }

  ErrorResponse parseError(response) {
    return errorResponseFromJson(response.body);
  }

  Future makeRestCall(
    RestType eventType,
    String endpoint, {
    Map payload, // POST or PUT body
    Map queryParameters, // GET query body
    bool authenticated = true,
  }) async {
    String url = "$_baseUrl$endpoint";
    final headers = authenticated
        ? {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${getIt<AuthService>().authToken}"
          }
        : {
            HttpHeaders.contentTypeHeader: "application/json",
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

      logger.i("response: ${response.statusCode}");
      if (response.statusCode != 200) {
        logger.e(response.body);
        return Future.error(parseError(response));
      }
      logger.i(response.body);
      return response;
    } on SocketException {
      logger.e("error: Socket Exception!");

      throw ErrorResponse(error: "No internet!");
    } catch (error) {
      logger.e("error: ${error.message}");
      throw ErrorResponse(error: error.message);
    }
  }
}

enum RestType {
  GET,
  PATCH,
  POST,
  PUT,
}
