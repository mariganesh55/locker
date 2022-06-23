// To parse this JSON data, do
//
//     final changePasscodeResponse = changePasscodeResponseFromJson(jsonString);

import 'dart:convert';

ChangePasscodeResponse changePasscodeResponseFromJson(String str) => ChangePasscodeResponse.fromJson(json.decode(str));

class ChangePasscodeResponse {
  ChangePasscodeResponse({
    this.lastErrorObject,
    this.value,
    this.ok,
    this.clusterTime,
    this.operationTime,
  });

  LastErrorObject? lastErrorObject;
  Value? value;
  int? ok;
  ClusterTime? clusterTime;
  Time? operationTime;

  factory ChangePasscodeResponse.fromJson(Map<String, dynamic> json) => ChangePasscodeResponse(
    lastErrorObject: LastErrorObject.fromJson(json["lastErrorObject"]),
    value: Value.fromJson(json["value"]),
    ok: json["ok"],
    clusterTime: ClusterTime.fromJson(json["\u0024clusterTime"]),
    operationTime: Time.fromJson(json["operationTime"]),
  );
}

class ClusterTime {
  ClusterTime({
    this.clusterTime,
    this.signature,
  });

  Time? clusterTime;
  Signature? signature;

  factory ClusterTime.fromJson(Map<String, dynamic> json) => ClusterTime(
    clusterTime: Time.fromJson(json["clusterTime"]),
    signature: Signature.fromJson(json["signature"]),
  );
}

class Time {
  Time({
    this.timestamp,
  });

  String? timestamp;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    timestamp: json["\u0024timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024timestamp": timestamp,
  };
}

class Signature {
  Signature({
    this.hash,
    this.keyId,
  });

  String? hash;
  KeyId? keyId;

  factory Signature.fromJson(Map<String, dynamic> json) => Signature(
    hash: json["hash"],
    keyId: KeyId.fromJson(json["keyId"]),
  );
}

class KeyId {
  KeyId({
    this.low,
    this.high,
    this.unsigned,
  });

  int? low;
  int? high;
  bool? unsigned;

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
    this.n,
    this.updatedExisting,
  });

  int? n;
  bool? updatedExisting;

  factory LastErrorObject.fromJson(Map<String, dynamic> json) => LastErrorObject(
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
    this.id,
    this.username,
    this.email,
    this.password,
    this.passcode,
  });

  String? id;
  String? username;
  String? email;
  String? password;
  String? passcode;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    passcode: json["passcode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "password": password,
    "passcode": passcode,
  };
}
