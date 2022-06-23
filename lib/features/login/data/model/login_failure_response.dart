// To parse this JSON data, do
//
//     final loginFailureResponse = loginFailureResponseFromJson(jsonString);

import 'dart:convert';

LoginFailureResponse loginFailureResponseFromJson(String str) => LoginFailureResponse.fromJson(json.decode(str));

String loginFailureResponseToJson(LoginFailureResponse data) => json.encode(data.toJson());

class LoginFailureResponse {
  LoginFailureResponse({
    required this.error,
  });

  String error;

  factory LoginFailureResponse.fromJson(Map<String, dynamic> json) => LoginFailureResponse(
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
  };
}
