import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';

import 'login_screen.dart';

class LoginHomeScreen extends StatefulWidget {
  const LoginHomeScreen({Key? key}) : super(key: key);

  @override
  _LoginHomeScreenState createState() => _LoginHomeScreenState();
}

class _LoginHomeScreenState extends State<LoginHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: const LoginScreen(),
      ),
    );
  }
}