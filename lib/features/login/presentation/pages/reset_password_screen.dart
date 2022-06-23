import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_theme.dart';
import 'package:locker/features/login/presentation/widgets/sucessful_widget.dart';
import 'package:page_transition/page_transition.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          SizedBox(width: size.width),
          Image.asset('assets/common/logo.png', height: 85, width: 60, color: const Color(0xFF75F0BD),),
          //text
          const SizedBox(height: 6,),
          const Text('Welcome to Smart Locker', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.lightGreen),),
          //text
          const SizedBox(height: 8,),
          const Text('Create New Password', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.textGrey,),),
          //new password
          const SizedBox(height: 28,),
          Container(
            height: 48,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.9),
                    spreadRadius: -25,
                    offset: Offset(5, 5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(51, 51, 51, 0.9),
                    spreadRadius: -10,
                    offset: Offset(-5, -5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.2),
                    spreadRadius: -10,
                    offset: Offset(5, -5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.2),
                    spreadRadius: -10,
                    offset: Offset(-5, 5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.5),
                    spreadRadius: -2,
                    offset: Offset(-1, -1)
                ),
                BoxShadow(
                    color: Color.fromRGBO(51, 51, 51, 0.3),
                    spreadRadius: -2,
                    offset: Offset(1, 1)
                ),
              ],
            ),
            child: Stack(
              children: [
                TextFormField(
                  decoration: AppTheme.textFieldDecoration('New password', 'assets/login/user_name.png'),
                  style: const TextStyle(color: AppColors.hintTextGrey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset('assets/common/key.png', height: 25, width: 25, color: AppColors.hintTextGrey,),
                )
              ],
            ),
          ),
          //confirm password
          const SizedBox(height: 28,),
          Container(
            height: 48,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.9),
                    spreadRadius: -25,
                    offset: Offset(5, 5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(51, 51, 51, 0.9),
                    spreadRadius: -10,
                    offset: Offset(-5, -5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.2),
                    spreadRadius: -10,
                    offset: Offset(5, -5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.2),
                    spreadRadius: -10,
                    offset: Offset(-5, 5)
                ),
                BoxShadow(
                    color: Color.fromRGBO(31, 31, 31, 0.5),
                    spreadRadius: -2,
                    offset: Offset(-1, -1)
                ),
                BoxShadow(
                    color: Color.fromRGBO(51, 51, 51, 0.3),
                    spreadRadius: -2,
                    offset: Offset(1, 1)
                ),
              ],
            ),
            child: Stack(
              children: [
                TextFormField(
                  decoration: AppTheme.textFieldDecoration('Re-Type password', 'assets/login/user_name.png'),
                  style: const TextStyle(color: AppColors.hintTextGrey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset('assets/common/key.png', height: 25, width: 25, color: AppColors.hintTextGrey,),
                )
              ],
            ),
          ),
          //create password
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const SucessfulWidget(),
                      duration: const Duration(
                          milliseconds: 250)));
              Future.delayed(const Duration(seconds: 1), (){
                Navigator.pop(context);
              });
            },
            child: Container(
              height: 57,
              width: 343,
              decoration: BoxDecoration(
                color: AppColors.colorGreen,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.9),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(-1, -1)),
                  BoxShadow(
                      color: Color.fromRGBO(140, 255, 255, 0.9),
                      spreadRadius: -4,
                      blurRadius: 4,
                      offset: Offset(-1, -1)),
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(-2, -2)),
                  BoxShadow(
                      color: Color.fromRGBO(36, 75, 66, 0.5),
                      spreadRadius: -2,
                      blurRadius: 2,
                      offset: Offset(-2, -2)),
                  BoxShadow(
                      color: Color.fromRGBO(140, 255, 255, 0.3),
                      spreadRadius: -2,
                      blurRadius: 2,
                      offset: Offset(-1, -1)),
                ],
              ),
              child: const Center(child: Text('Create Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}

