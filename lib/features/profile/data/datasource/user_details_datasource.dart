import 'dart:convert';
import 'dart:io';

import 'package:locker/core/app_url.dart';
import 'package:locker/core/error/exceptions.dart';
import 'package:locker/features/profile/data/model/user_details_response.dart';
import 'package:http/http.dart' as http;

import '../../../../core/app_helpers.dart';
import '../model/change_passcode_response.dart';

class UserDetailsDataSource {
  Future<List<UserDetailsResponse>> getUserDetails(String email) async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse(AppUrl.userDetails),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({'email': email}));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print('res' + jsonString.toString());
        List<UserDetailsResponse> res = userDetailsResponseFromJson(jsonString);
        return res;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<ChangePasscodeResponse> changePasscode(String passcode) async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse(AppUrl.createPasscode),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({'email': AppHelpers.SHARED_PREFERENCES.getString('user')!, 'passcode': passcode}));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print('res' + jsonString.toString());
        ChangePasscodeResponse res = changePasscodeResponseFromJson(jsonString);
        return res;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
