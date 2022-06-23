import 'dart:convert';
import 'dart:io';

import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/lockers/data/model/all_locker_response.dart';
import 'package:http/http.dart' as http;
import 'package:locker/features/lockers/data/model/locker_history_response.dart';
import 'package:locker/features/lockers/data/model/update_locker_response.dart';

import '../../../../core/app_url.dart';
import '../../../../core/error/exceptions.dart';

class LockerDatasource {
  Future<List<AllLockerResponse>> getAllLockerDetails() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(AppUrl.allLocker),
        //headers: {"Authorization": AppConstants().AUTHORIZATION},
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        List<AllLockerResponse> res = allLockerResponseFromJson(jsonString);
        print("all locker --> $res");
        return res;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<bool> unlockLocker(String name, String key, String publishTopic,
      String subscribeTopic) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.unlock),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({
            "name": name,
            "key": key,
            "publish_topic": publishTopic,
            "subscribe_topic": subscribeTopic
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addLocker(String name) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.releaseLocker),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({
            "name": name,
            "user": AppHelpers.SHARED_PREFERENCES.getString('user')
          }));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        UpdateLockerResponse updateResponse =
            updateLockerResponseFromJson(jsonString);
        return updateResponse.lastErrorObject.updatedExisting;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> releaseLocker(String name) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.releaseLocker),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({"name": name, "user": ""}));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        UpdateLockerResponse updateResponse =
            updateLockerResponseFromJson(jsonString);
        return updateResponse.lastErrorObject.updatedExisting;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<LockerHistoryResponse>> getLockerHistory() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(AppUrl.lockerHistory),
        // headers: {"Authorization": AppConstants().AUTHORIZATION},
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        List<LockerHistoryResponse> res =
            lockerHistoryResponseFromJson(jsonString);
        return res;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
