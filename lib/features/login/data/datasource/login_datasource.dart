import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:locker/core/show_snackbar.dart';
import 'package:locker/features/login/data/model/login_failure_response.dart';

import '../../../../core/app_helpers.dart';
import '../../../../core/app_url.dart';
import '../../../../core/error/exceptions.dart';

class LoginDatasource {
  Future<bool> userLogin(String email, String password) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.login),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({'email': email, 'password': password}));
      if (response.statusCode == 200) {
        print(response.body);
        AppHelpers.SHARED_PREFERENCES.setString('auth', response.body);
        return true;
      } else {
        LoginFailureResponse res = loginFailureResponseFromJson(response.body);
        showSnackBar(
            context: Get.context!, message: res.error, bgColor: Colors.red);
        throw ServerException();
      }
    } catch (e) {
      showSnackBar(
          context: Get.context!, message: e.toString(), bgColor: Colors.red);
      throw ServerException();
    }
  }
}
