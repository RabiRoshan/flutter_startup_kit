import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  String timestamp;
  int status;
  String error;
  String message;
  String path;

  ErrorResponse({
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        status: json["status"] == null ? null : json["status"],
        error: json["error"] == null ? null : json["error"],
        message: json["message"] == null ? null : json["message"],
        path: json["path"] == null ? null : json["path"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp == null ? null : timestamp,
        "status": status == null ? null : status,
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "path": path == null ? null : path,
      };
}
