import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_theme.dart';
import 'package:locker/features/login/data/datasource/login_datasource.dart';
import 'package:locker/features/login/presentation/pages/signin_screen.dart';
import 'package:locker/features/login/presentation/widgets/reserve_locker_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/app_helpers.dart';
import '../../../../core/show_snackbar.dart';
import '../../../profile/data/datasource/user_details_datasource.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email, _password;

  bool _isLoading = false;

  bool showPassword = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _googleSignIn._googleSignIn.onCurrentUserChanged
    //     .listen((GoogleSignInAccount? account) async {
    //   _currentUser = account;
    //   _email = _currentUser?.email;
    //
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   await UserDetailsDataSource.emailLogin(_email!).then((value) async {
    //     if (value) {
    //       await getUserDetail();
    //     } else {
    //       await UserDetailsDataSource.emailRegister(_email!)
    //           .then((value) async {
    //         if (value) {
    //           await getUserDetail();
    //         }
    //       });
    //     }
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //logo
          const SizedBox(height: 115),
          Image.asset(
            'assets/common/lock.png',
            height: 85,
            width: 60,
            // color: const Color(0xFF75F0BD),
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
            'Sign in to continue',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.textGrey,
            ),
          ),
          //email
          const SizedBox(
            height: 15,
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
                      'Email', 'assets/login/user_name.png'),
                  style: const TextStyle(
                      color: AppColors.hintTextGrey, fontSize: 12),
                  onChanged: (val) => _email = val,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset(
                    'assets/common/email.png',
                    height: 25,
                    width: 25,
                    color: AppColors.hintTextGrey,
                  ),
                )
              ],
            ),
          ),
          //Password
          const SizedBox(
            height: 15,
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
                  obscureText: !showPassword,
                  decoration: AppTheme.textFieldDecoration(
                    'Password',
                    'assets/login/password.png',
                  ).copyWith(
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => showPassword = !showPassword),
                      child: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF5FB3AB),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                      color: AppColors.hintTextGrey, fontSize: 12),
                  onChanged: (val) => _password = val,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 11),
                  child: Image.asset(
                    'assets/login/password.png',
                    height: 25,
                    width: 25,
                    color: AppColors.hintTextGrey,
                  ),
                )
              ],
            ),
          ),
          //sign in button
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              {
                if (_email != null && _password != null) {
                  //validate email
                  if (GetUtils.isEmail(_email!)) {
                    var rx = RegExp("\b*@izeno\.com\$", caseSensitive: false);

                    if (rx.hasMatch(_email!)) {
                      setState(() {
                        _isLoading = true;
                      });
                      LoginDatasource()
                          .userLogin(_email!, _password!)
                          .then((value) async {
                        print("login response -> ${value}");
                        if (value) {
                          await getUserDetail();
                        }
                      }).catchError((e) {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    } else {
                      showSnackBar(
                          context: context,
                          message: 'Invalid domain name',
                          bgColor: Colors.red);
                    }
                  } else {
                    showSnackBar(
                        context: context,
                        message: 'Email not valid',
                        bgColor: Colors.red);
                  }
                } else {
                  showSnackBar(
                      context: context,
                      message: 'Values can\'t be empty',
                      bgColor: Colors.red);
                }
                /*Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const OTPWidget(),
                      duration: const Duration(
                          milliseconds: 250)))*/
              }
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
              child: Center(
                  child: _isLoading
                      ? Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )),
                        )
                      : Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
            ),
          ),
          //or
          const SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //divider
              SizedBox(
                width: 134,
                child: AppTheme.divider(),
              ),
              //or
              const SizedBox(
                width: 28,
              ),
              const Text(
                'OR',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutralGrey),
              ),
              const SizedBox(
                width: 23,
              ),
              //divider
              SizedBox(
                width: 134,
                child: AppTheme.divider(),
              ),
            ],
          ),
          //social login
          const SizedBox(height: 21),
          InkWell(
            onTap: () {
              _handleSignIn();
            },
            child: Container(
              height: 57,
              width: 343,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  border: Border.all(
                      color: const Color.fromRGBO(88, 184, 161, 0.5), width: 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 0, blurRadius: 3)
                  ]),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16.5,
                  ),
                  Image.asset(
                    'assets/login/google.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 63,
                  ),
                  const Text(
                    'Login with Google',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 16.5,
                  ),
                ],
              ),
            ),
          ),

          if (Platform.isIOS)
            Column(
              children: [
                const SizedBox(height: 11),
                Padding(
                  padding: const EdgeInsets.all(11),
                  child: SignInWithAppleButton(
                    onPressed: () async {
                      final credential =
                          await SignInWithApple.getAppleIDCredential(
                        scopes: [
                          AppleIDAuthorizationScopes.email,
                          AppleIDAuthorizationScopes.fullName,
                        ],
                      );

                      if (credential.email == null ||
                          credential.email!.trim().isEmpty) {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const SignInScreen(),
                                duration: const Duration(milliseconds: 250)));
                      } else if (credential.email != null &&
                          credential.givenName != null) {
                        _email = credential.email;

                        AppHelpers.SHARED_PREFERENCES.setString('passcode', "");
                        AppHelpers.SHARED_PREFERENCES.setBool('isLogged', true);
                        AppHelpers.SHARED_PREFERENCES
                            .setString('user', credential.email!);
                        AppHelpers.SHARED_PREFERENCES
                            .setString('name', credential.givenName ?? '');

                        await getUserDetail();

                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.fade,
                        //         child: const ReserveLockerWidget(),
                        //         duration: const Duration(milliseconds: 250)));
                      }

                      // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
                      // after they have been validated with Apple (see `Integration` section for more information on how to do this)
                    },
                  ),
                ),
              ],
            ),
          //forgot password
          const SizedBox(height: 11),
          // TextButton(
          //     onPressed: () => Navigator.push(
          //         context,
          //         PageTransition(
          //             type: PageTransitionType.rightToLeft,
          //             child: const ForgotPasswordScreen(),
          //             duration: const Duration(milliseconds: 250))),
          //     child: const Text(
          //       'Forgot Password?',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w700,
          //           fontSize: 12,
          //           color: AppColors.colorTextGreen),
          //     )),
          //register
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text('New User?',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w800,
          //             fontSize: 12,
          //             color: AppColors.textGrey)),
          //     TextButton(
          //         onPressed: () => Navigator.push(
          //             context,
          //             PageTransition(
          //                 type: PageTransitionType.rightToLeft,
          //                 child: const SignInScreen(),
          //                 duration: const Duration(milliseconds: 250))),
          //         child: const Text(
          //           'Signup',
          //           style: TextStyle(
          //               fontWeight: FontWeight.w800,
          //               fontSize: 12,
          //               color: AppColors.colorTextGreen),
          //         ))
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Version " +
                  (AppHelpers.SHARED_PREFERENCES.getString("version") ?? ''),
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getUserDetail() async {
    await UserDetailsDataSource.getUserDetails(_email!).then((data) {
      setState(() {
        _isLoading = false;
      });
      if (data.first.approve == true) {
        if (data.first.passcode != null)
          AppHelpers.SHARED_PREFERENCES
              .setString('passcode', data.first.passcode!);
        AppHelpers.SHARED_PREFERENCES.setBool('isLogged', true);
        AppHelpers.SHARED_PREFERENCES.setString('user', _email!);
        AppHelpers.SHARED_PREFERENCES
            .setString('name', data.first.username ?? '');
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: const ReserveLockerWidget(),
                duration: const Duration(milliseconds: 250)));
      } else {
        AppHelpers.SHARED_PREFERENCES.clear();
        showSnackBar(
            context: context,
            message: 'User is not approved yet.',
            bgColor: Colors.red);
      }
    });
  }

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        _currentUser = account;
        _email = _currentUser?.email;
        setState(() {
          _isLoading = true;
        });
        await UserDetailsDataSource.emailLogin(_email!).then((value) async {
          if (value) {
            await getUserDetail();
          } else {
            await UserDetailsDataSource.emailRegister(_email!)
                .then((value) async {
              if (value) {
                await getUserDetail();
              }
            });
          }
          setState(() {
            _isLoading = false;
          });
        });
      }
    } catch (error) {
      print(error);
    }
  }
}
