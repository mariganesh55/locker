import 'dart:convert';

List<AllLockerResponse> allLockerResponseFromJson(String str) {
  // print("object string  --> $str");
  return List<AllLockerResponse>.from(
        json.decode(str).map((x) {
          print("object decode  --> $x");
          return AllLockerResponse.fromJson(x);
        }));
}

String allLockerResponseToJson(List<AllLockerResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllLockerResponse {
  AllLockerResponse({
    required this.id,
    required this.name,
    required this.status,
    required this.key,
    this.publishTopic,
    this.subscribeTopic,
    this.user,
    this.userStatus,
  });

  String id;
  String name;
  String status;
  String key;
  String? publishTopic;
  String? subscribeTopic;
  String? user;
  String? userStatus;

  factory AllLockerResponse.fromJson(Map<String, dynamic> json) =>
      AllLockerResponse(
          id: json["_id"],
          name: json["name"],
          status: json["status"],
          key: json["key"],
          // publishTopic: json["publish_topic"],
          publishTopic: null,
          // subscribeTopic: json["subscribe_topic"],
          subscribeTopic: null,
          user: json["user"],
          userStatus: json["userstatus"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "key": key,
        "publish_topic": publishTopic,
        "subscribe_topic": subscribeTopic,
        "user": user,
        "userstatus": userStatus,
      };
}
