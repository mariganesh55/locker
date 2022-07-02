// To parse this JSON data, do
//
//     final userDetailsResponse = userDetailsResponseFromJson(jsonString);

import 'dart:convert';

List<UserDetailsResponse> userDetailsResponseFromJson(String str) =>
    List<UserDetailsResponse>.from(
        json.decode(str).map((x) => UserDetailsResponse.fromJson(x)));

String userDetailsResponseToJson(List<UserDetailsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailsResponse {
  UserDetailsResponse(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      this.role,
      this.passcode,
      this.approve});

  String id;
  String username;
  String email;
  String password;
  String? role;
  String? passcode;
  bool? approve;

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailsResponse(
          id: json["_id"],
          username: json["username"],
          email: json["email"],
          password: json["password"],
          role: json["role"],
          approve: json["approve"],
          passcode: json["passcode"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "role": role,
        "approve":approve
      };
}
