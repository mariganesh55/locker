import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/core/getx_controllers.dart';
import 'package:locker/features/profile/data/datasource/user_details_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialiseControllers();
  AppHelpers.SHARED_PREFERENCES = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: const SplashScreen(),
    );
  }
}
