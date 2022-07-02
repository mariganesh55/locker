import 'package:flutter/material.dart';
import 'package:locker/features/login/presentation/pages/login_home_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../features/home/presentation/pages/home_screen_main.dart';
import 'app_colors.dart';
import 'app_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    bool _isLogged = AppHelpers.SHARED_PREFERENCES.getBool('isLogged') ?? false;
    Future.delayed(
        const Duration(milliseconds: 3500),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: _isLogged
                    ? const HomeScreenMain()
                    : const LoginHomeScreen(),
                duration: const Duration(milliseconds: 350))));
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => setState(() => _visible = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/login/splash.png',
              fit: BoxFit.cover,
              height: size.height,
              width: size.width,
            ),
            AnimatedOpacity(
              opacity: _visible ? 0.3 : 1,
              duration: const Duration(seconds: 3),
              child: Container(
                height: size.height,
                width: size.width,
                color: AppColors.scaffoldBG,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/common/lock.png',
                    width: 80.88,
                    height: 114.59,
                  ),
                  const Text(
                    'SMART DIGI LOCKER',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: AppColors.lightGreen),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
