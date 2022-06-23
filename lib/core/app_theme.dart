import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class AppTheme {

  static InputDecoration textFieldDecoration(String hintText, String iconPath) =>
      InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.hintTextGrey,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText.tr,
        contentPadding: const EdgeInsets.only(left: 51)
        //prefixIcon: SizedBox(height: 20, width: 20, child: Image.asset(iconPath, height: 20, width: 20,)),
      );

  static Widget divider() => Container(
    width: Get.width,
    height: 1,
    color: AppColors.textFieldBorderColor,
  );

}
