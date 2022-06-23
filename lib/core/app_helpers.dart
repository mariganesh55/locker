import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelpers{
  static List<BoxShadow> boxShadowList = const [
    BoxShadow(
        color: Color.fromRGBO(31, 31, 31, 0.9),
        blurRadius: 10,
        offset: Offset(5, 5)),
    BoxShadow(
        color: Color.fromRGBO(62, 62, 62, 0.9),
        blurRadius: 10,
        offset: Offset(-5, -5)),
    BoxShadow(
        color: Color.fromRGBO(31, 31, 31, 0.2),
        blurRadius: 10,
        offset: Offset(5, -5)),
    BoxShadow(
        color: Color.fromRGBO(31, 31, 31, 0.2),
        blurRadius: 10,
        offset: Offset(-5, 5)),
    BoxShadow(
        color: Color.fromRGBO(31, 31, 31, 0.5),
        blurRadius: 2,
        blurStyle: BlurStyle.inner,
        offset: Offset(-1, -1)),
    BoxShadow(
        color: Color.fromRGBO(51, 51, 51, 0.3),
        blurRadius: 2,
        blurStyle: BlurStyle.inner,
        offset: Offset(1, 1)),
  ];

  static List<BoxShadow> bottomNavigatorShadowList = const [
    BoxShadow(
        color: Color.fromRGBO(23, 23, 23, 0.9),
        blurRadius: 3,
        blurStyle: BlurStyle.inner,
        offset: Offset(1, 1)),
    BoxShadow(
        color: Color.fromRGBO(59, 59, 59, 0.9),
        blurRadius: 2,
        blurStyle: BlurStyle.inner,
        offset: Offset(-1, -1)),
    BoxShadow(
        color: Color.fromRGBO(23, 23, 23, 0.2),
        blurRadius: 2,
        blurStyle: BlurStyle.inner,
        offset: Offset(1, -1)),
    BoxShadow(
        color: Color.fromRGBO(23, 23, 23, 0.2),
        blurRadius: 2,
        blurStyle: BlurStyle.inner,
        offset: Offset(-1, 1)),
    BoxShadow(
        color: Color.fromRGBO(23, 23, 23, 0.5),
        blurRadius: 2,
        offset: Offset(-1, -1)),
    BoxShadow(
        color: Color.fromRGBO(59, 59, 59, 0.3),
        blurRadius: 2,
        offset: Offset(1, 1)),
  ];

  static late SharedPreferences SHARED_PREFERENCES;
}