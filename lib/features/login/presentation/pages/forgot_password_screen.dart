import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_theme.dart';
import 'package:locker/features/login/presentation/widgets/otp_widget.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldBG,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          SizedBox(width: size.width),
          Image.asset(
            'assets/common/logo.png',
            height: 85,
            width: 60,
            color: const Color(0xFF75F0BD),
          ),
          //text
          const SizedBox(
            height: 6,
          ),
          const Text(
            'Welcome to Smart Digi Locker',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.lightGreen),
          ),
          //text
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Enter your email address',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.textGrey,
            ),
          ),
          //mobile
          const SizedBox(
            height: 28,
          ),
          Container(
            height: 48,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.9),
                    spreadRadius: -25,
                    offset: Offset(5, 5)),
                BoxShadow(
                    color: Color.fromRGBO(51, 51, 51, 0.9),
                    spreadRadius: -10,
                    offset: Offset(-5, -5)),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.2),
                    spreadRadius: -10,
                    offset: Offset(5, -5)),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.2),
                    spreadRadius: -10,
                    offset: Offset(-5, 5)),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.5),
                    spreadRadius: -2,
                    offset: Offset(-1, -1)),
                BoxShadow(
                    color: Color.fromRGBO(51, 51, 51, 0.3),
                    spreadRadius: -2,
                    offset: Offset(1, 1)),
              ],
            ),
            child: Stack(
              children: [
                TextFormField(
                  decoration: AppTheme.textFieldDecoration(
                      'Email Address', 'assets/login/user_name.png'),
                  style: const TextStyle(
                      color: AppColors.hintTextGrey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset(
                    'assets/common/mobile.png',
                    height: 25,
                    width: 25,
                    color: AppColors.hintTextGrey,
                  ),
                )
              ],
            ),
          ),
          //send otp
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const OTPWidget(
                      forgotPassword: true,
                    ),
                    duration: const Duration(milliseconds: 250))),
            child: Container(
              height: 57,
              width: 343,
              decoration: BoxDecoration(
                color: const Color(0xFF5FB3AB),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.9),
                      blurRadius: 5,
                      offset: Offset(2, 2)),
                  BoxShadow(
                      color: Color.fromRGBO(140, 255, 255, 0.9),
                      blurRadius: 4,
                      offset: Offset(-2, -2)),
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.2),
                      blurRadius: 4,
                      offset: Offset(2, -2)),
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.5),
                      blurRadius: 4,
                      offset: Offset(-2, 2)),
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.5),
                      blurRadius: 2,
                      blurStyle: BlurStyle.inner,
                      offset: Offset(-1, -1)),
                  BoxShadow(
                      color: Color.fromRGBO(140, 255, 255, 0.3),
                      blurRadius: 2,
                      blurStyle: BlurStyle.inner,
                      offset: Offset(1, 1)),
                ],
              ),
              child: const Center(
                  child: Text(
                'Send OTP',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
            ),
          ),
          //register
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Back")),
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text('Don’t have a account?',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w800,
          //             fontSize: 12,
          //             color: AppColors.textGrey)),
          //     TextButton(
          //         onPressed: () => Navigator.pushReplacement(
          //             context,
          //             PageTransition(
          //                 type: PageTransitionType.rightToLeft,
          //                 child: const SignInScreen(),
          //                 duration: const Duration(milliseconds: 250))),
          //         child: const Text(
          //           'Register',
          //           style: TextStyle(
          //               fontWeight: FontWeight.w800,
          //               fontSize: 12,
          //               color: AppColors.colorTextGreen),
          //         ))
          //   ],
          // )
        ],
      ),
    );
  }
}
