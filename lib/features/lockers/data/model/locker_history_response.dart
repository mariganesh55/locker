// To parse this JSON data, do
//
//     final lockerHistoryResponse = lockerHistoryResponseFromJson(jsonString);

import 'dart:convert';

List<LockerHistoryResponse> lockerHistoryResponseFromJson(String str) =>
    List<LockerHistoryResponse>.from(
        json.decode(str).map((x) => LockerHistoryResponse.fromJson(x)));

String lockerHistoryResponseToJson(List<LockerHistoryResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LockerHistoryResponse {
  LockerHistoryResponse({
    required this.id,
    required this.time,
    required this.name,
  });

  String id;
  String? time;
  String? name;

  factory LockerHistoryResponse.fromJson(Map<String, dynamic> json) =>
      LockerHistoryResponse(
        id: json["_id"],
        time: json["time"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "time": time,
        "name": name,
      };
}
