import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_theme.dart';
import 'package:locker/core/show_snackbar.dart';
import 'package:locker/features/login/data/datasource/register_datasource.dart';
import 'package:locker/features/login/presentation/widgets/otp_widget.dart';
import 'package:page_transition/page_transition.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  String? _username, _email, _password;
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
          Image.asset('assets/common/logo.png', height: 85, width: 60, color: const Color(0xFF75F0BD),),
          //text
          const SizedBox(height: 6,),
          const Text('Welcome to Smart Locker', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.lightGreen),),
          //text
          const SizedBox(height: 8,),
          const Text('Sign in to continue', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.textGrey,),),
          //user name
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
                  decoration: AppTheme.textFieldDecoration('User Name', 'assets/login/user_name.png'),
                  style: const TextStyle(color: AppColors.hintTextGrey, fontSize: 12),
                  onChanged: (val) => _username = val,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset('assets/login/user_name.png', height: 25, width: 25, color: AppColors.hintTextGrey,),
                )
              ],
            ),
          ),
          //email
          const SizedBox(height: 15,),
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
                  decoration: AppTheme.textFieldDecoration('Email', 'assets/login/user_name.png'),
                  style: const TextStyle(color: AppColors.hintTextGrey, fontSize: 12),
                  onChanged: (val) => _email = val,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset('assets/common/email.png', height: 25, width: 25, color: AppColors.hintTextGrey,),
                )
              ],
            ),
          ),
          //Password
          const SizedBox(height: 15,),
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
                  decoration: AppTheme.textFieldDecoration('Password', 'assets/login/password.png'),
                  style: const TextStyle(color: AppColors.hintTextGrey, fontSize: 12),
                  onChanged: (val) => _password = val,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset('assets/login/password.png', height: 25, width: 25, color: AppColors.hintTextGrey,),
                )
              ],
            ),
          ),
          /*//imei number
          const SizedBox(height: 15,),
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
                  decoration: AppTheme.textFieldDecoration('IMEI Number', 'assets/login/user_name.png'),
                  style: const TextStyle(color: AppColors.hintTextGrey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset('assets/common/imei.png', height: 25, width: 25, color: AppColors.hintTextGrey,),
                )
              ],
            ),
          ),*/
          //register
          const SizedBox(height: 53,),
          InkWell(
            onTap: (){
              if(_email != null && _password != null && _username != null){
                //validate email
                if(GetUtils.isEmail(_email!)){
                  if(_password!.trim().length >= 8){
                    RegisterDatasource().registerUser(_username!, _email!, _password!).then((value){
                      if(value){
                        Navigator.pop(context);
                      }
                    });
                  }
                  else {
                    showSnackBar(context: context, message: 'Password too short', bgColor: Colors.red);
                  }
                }
                else {
                  showSnackBar(context: context, message: 'Email not valid', bgColor: Colors.red);
                }
              }
              else {
                showSnackBar(context: context, message: 'Values can\'t be empty', bgColor: Colors.red);
              }
              /*Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const OTPWidget(),
                      duration: const Duration(
                          milliseconds: 250)))*/
            },
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
              child: const Center(child: Text('Register', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}
