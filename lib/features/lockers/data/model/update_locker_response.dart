// To parse this JSON data, do
//
//     final updateLockerResponse = updateLockerResponseFromJson(jsonString);

import 'dart:convert';

UpdateLockerResponse updateLockerResponseFromJson(String str) =>
    UpdateLockerResponse.fromJson(json.decode(str));

String updateLockerResponseToJson(UpdateLockerResponse data) =>
    json.encode(data.toJson());

class UpdateLockerResponse {
  UpdateLockerResponse({
    required this.lastErrorObject,
    required this.value,
    required this.ok,
    required this.clusterTime,
    required this.operationTime,
  });

  LastErrorObject lastErrorObject;
  Value value;
  int ok;
  ClusterTime clusterTime;
  Time operationTime;

  factory UpdateLockerResponse.fromJson(Map<String, dynamic> json) =>
      UpdateLockerResponse(
        lastErrorObject: LastErrorObject.fromJson(json["lastErrorObject"]),
        value: Value.fromJson(json["value"]),
        ok: json["ok"],
        clusterTime: ClusterTime.fromJson(json["\u0024clusterTime"]),
        operationTime: Time.fromJson(json["operationTime"]),
      );

  Map<String, dynamic> toJson() => {
        "lastErrorObject": lastErrorObject.toJson(),
        "value": value.toJson(),
        "ok": ok,
        "\u0024clusterTime": clusterTime.toJson(),
        "operationTime": operationTime.toJson(),
      };
}

class ClusterTime {
  ClusterTime({
    required this.clusterTime,
    required this.signature,
  });

  Time clusterTime;
  Signature signature;

  factory ClusterTime.fromJson(Map<String, dynamic> json) => ClusterTime(
        clusterTime: Time.fromJson(json["clusterTime"]),
        signature: Signature.fromJson(json["signature"]),
      );

  Map<String, dynamic> toJson() => {
        "clusterTime": clusterTime.toJson(),
        "signature": signature.toJson(),
      };
}

class Time {
  Time({
    required this.timestamp,
  });

  String timestamp;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        timestamp: json["\u0024timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024timestamp": timestamp,
      };
}

class Signature {
  Signature({
    required this.hash,
    required this.keyId,
  });

  String hash;
  KeyId keyId;

  factory Signature.fromJson(Map<String, dynamic> json) => Signature(
        hash: json["hash"],
        keyId: KeyId.fromJson(json["keyId"]),
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "keyId": keyId.toJson(),
      };
}

class KeyId {
  KeyId({
    required this.low,
    required this.high,
    required this.unsigned,
  });

  int low;
  int high;
  bool unsigned;

  factory KeyId.fromJson(Map<String, dynamic> json) => KeyId(
        low: json["low"],
        high: json["high"],
        unsigned: json["unsigned"],
      );

  Map<String, dynamic> toJson() => {
        "low": low,
        "high": high,
        "unsigned": unsigned,
      };
}

class LastErrorObject {
  LastErrorObject({
    required this.n,
    required this.updatedExisting,
  });

  int n;
  bool updatedExisting;

  factory LastErrorObject.fromJson(Map<String, dynamic> json) =>
      LastErrorObject(
        n: json["n"],
        updatedExisting: json["updatedExisting"],
      );

  Map<String, dynamic> toJson() => {
        "n": n,
        "updatedExisting": updatedExisting,
      };
}

class Value {
  Value({
    required this.id,
    required this.name,
    required this.status,
    required this.subscribeTopic,
    required this.publishTopic,
    required this.key,
    this.user,
  });

  String id;
  String name;
  String status;
  String subscribeTopic;
  String publishTopic;
  String key;
  String? user;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
        subscribeTopic: json["subscribe_topic"],
        publishTopic: json["publish_topic"],
        key: json["key"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "subscribe_topic": subscribeTopic,
        "publish_topic": publishTopic,
        "key": key,
        "user": user,
      };
}
