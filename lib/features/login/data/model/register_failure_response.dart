// To parse this JSON data, do
//
//     final registerFailureResponse = registerFailureResponseFromJson(jsonString);

import 'dart:convert';

RegisterFailureResponse registerFailureResponseFromJson(String str) => RegisterFailureResponse.fromJson(json.decode(str));

String registerFailureResponseToJson(RegisterFailureResponse data) => json.encode(data.toJson());

class RegisterFailureResponse {
  RegisterFailureResponse({
    required this.error,
  });

  String error;

  factory RegisterFailureResponse.fromJson(Map<String, dynamic> json) => RegisterFailureResponse(
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
  };
}
