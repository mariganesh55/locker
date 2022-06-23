import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:locker/core/show_snackbar.dart';
import 'package:locker/features/login/data/model/register_failure_response.dart';
import 'package:locker/features/login/data/model/register_response.dart';

import '../../../../core/app_url.dart';

class RegisterDatasource{
  Future<bool> registerUser(String username, String email, String password) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.register),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({
            'username': username,
            'email': email,
            'password': password,
            'passcode': ''
          })
      );
      if (response.statusCode == 200) {
        RegisterResponse res = registerResponseFromJson(response.body);
        showSnackBar(context: Get.context!, message: res.message + ' Login to continue');
        return true;
      } else {
        RegisterFailureResponse res = registerFailureResponseFromJson(response.body);
        showSnackBar(context: Get.context!, message: res.error, bgColor: Colors.red);
        return false;
      }
    } catch (e) {
      showSnackBar(context: Get.context!, message: e.toString(), bgColor: Colors.red);
      return false;
    }
  }
}
