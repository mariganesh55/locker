import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/core/show_snackbar.dart';
import 'package:locker/features/lockers/data/datasource/locker_datasource.dart';
import 'package:locker/features/lockers/data/model/all_locker_response.dart';
import 'package:locker/features/login/presentation/widgets/sucessful_widget.dart';
import 'package:locker/features/profile/data/datasource/user_details_datasource.dart';
import 'package:page_transition/page_transition.dart';

class PasswordWidget extends StatefulWidget {
  final String? password;
  final String? confirmPassword;
  final bool? changePassCode;
  final String? lockerOperation;
  final AllLockerResponse? response;
  const PasswordWidget(
      {Key? key,
      this.password,
      this.confirmPassword,
      this.changePassCode,
      this.lockerOperation,
      this.response})
      : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  FocusNode textFirstFocusNode = FocusNode();
  FocusNode textSecondFocusNode = FocusNode();
  FocusNode textThirdFocusNode = FocusNode();
  FocusNode textFourthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: Container(
        height: 194,
        width: 343.92,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 34.6,
                ),
                widget.changePassCode == false
                    ? Text(
                        'Enter Passcode',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      )
                    : widget.changePassCode == true &&
                            (AppHelpers.SHARED_PREFERENCES
                                        .getString('passcode') !=
                                    null &&
                                AppHelpers.SHARED_PREFERENCES
                                        .getString('passcode') !=
                                    '')
                        ? Text(
                            widget.password == null
                                ? 'Old Passcode'
                                : 'New Passcode',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          )
                        : Text(
                            widget.password == null
                                ? 'New Password'
                                : 'ReEnter Password',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                const SizedBox(
                  height: 27.83,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _otp(1, textFirstFocusNode),
                    const SizedBox(
                      width: 15.73,
                    ),
                    _otp(2, textSecondFocusNode),
                    const SizedBox(
                      width: 15.73,
                    ),
                    _otp(3, textThirdFocusNode),
                    const SizedBox(
                      width: 15.73,
                    ),
                    _otp(4, textFourthFocusNode),
                    const SizedBox(
                      width: 15.73,
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 19, top: 14),
                child: _closeBox(),
              ),
            )
          ],
        ),
      ),
    ));
  }

  String _password = '';

  Widget _otp(int index, FocusNode focusNode) => Container(
        height: 41.94,
        width: 41.94,
        decoration: BoxDecoration(
            color: AppColors.otpBoxColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(185, 185, 185, 0.9),
                  spreadRadius: -8,
                  offset: Offset(3, 3)),
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  spreadRadius: -6,
                  offset: Offset(-3, -3)),
              BoxShadow(
                  color: Color.fromRGBO(185, 185, 185, 0.2),
                  spreadRadius: -6,
                  offset: Offset(3, -3)),
              BoxShadow(
                  color: Color.fromRGBO(185, 185, 185, 0.2),
                  spreadRadius: -6,
                  offset: Offset(-3, 3)),
              BoxShadow(
                  color: Color.fromRGBO(185, 185, 185, 0.5),
                  spreadRadius: 2,
                  offset: Offset(-1, -1),
                  blurRadius: 10,
                  blurStyle: BlurStyle.inner),
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  spreadRadius: 2,
                  offset: Offset(1, 1),
                  blurRadius: 10,
                  blurStyle: BlurStyle.inner),
            ]),
        child: TextFormField(
          keyboardType: TextInputType.number,
          focusNode: focusNode,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 0),
            hintText: '*',
            hintStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (val) {
            if (val.length == 1) {
              _password += val;
              print(_password);
              if (index == 1) textSecondFocusNode.requestFocus();
              if (index == 2) textThirdFocusNode.requestFocus();
              if (index == 3) textFourthFocusNode.requestFocus();
              if (index == 4) {
                if (widget.password != null) {
                  UserDetailsDataSource()
                      .changePasscode(_password)
                      .then((value) {
                    Navigator.pop(context);
                    Future.delayed(
                        (const Duration(milliseconds: 300)),
                        () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: const SucessfulWidget(),
                                duration: const Duration(milliseconds: 250))));
                    AppHelpers.SHARED_PREFERENCES
                        .setString('passcode', _password);
                  }).catchError((e) {
                    showSnackBar(context: context, message: 'error occurred');
                  });
                } else {
                  if (widget.changePassCode == true &&
                      AppHelpers.SHARED_PREFERENCES.getString('passcode') !=
                          null &&
                      AppHelpers.SHARED_PREFERENCES.getString('passcode') !=
                          '') {
                    if (AppHelpers.SHARED_PREFERENCES.getString('passcode') ==
                        _password) {
                      Navigator.pop(context);
                      Future.delayed(
                          (const Duration(milliseconds: 300)),
                          () => Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: PasswordWidget(
                                    password: val,
                                    changePassCode: true,
                                  ),
                                  duration:
                                      const Duration(milliseconds: 250))));
                    } else
                      showSnackBar(
                          context: context, message: 'password does not match');
                  } else if (widget.changePassCode == true &&
                      (AppHelpers.SHARED_PREFERENCES.getString('passcode') ==
                              null ||
                          AppHelpers.SHARED_PREFERENCES.getString('passcode') ==
                              '')) {
                    Navigator.pop(context);
                    Future.delayed(
                        (const Duration(milliseconds: 300)),
                        () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: PasswordWidget(
                                  password: val,
                                  changePassCode: true,
                                ),
                                duration: const Duration(milliseconds: 250))));
                  } else {
                    if (AppHelpers.SHARED_PREFERENCES.getString('passcode') ==
                        _password) {
                      ///TODO verify passcode
                      if (widget.lockerOperation == 'Add') {
                        LockerDatasource()
                            .addLocker(
                          widget.response!.name,
                        )
                            .then((value) {
                          if (value) {
                            showSnackBar(
                                context: context,
                                message: 'Locker Added successfully',
                                bgColor: Colors.green);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            showSnackBar(
                                context: context,
                                message: 'Failed to add Locker',
                                bgColor: Colors.red);
                          }
                        });
                      }
                      if (widget.lockerOperation == 'Release') {
                        LockerDatasource()
                            .releaseLocker(
                          widget.response!.name,
                        )
                            .then((value) {
                          if (value) {
                            showSnackBar(
                                context: context,
                                message: 'Locker Released successfully',
                                bgColor: Colors.green);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            showSnackBar(
                                context: context,
                                message: 'Failed to release Locker',
                                bgColor: Colors.red);
                          }
                        });
                      }

                      /*Navigator.pop(context);
                  Future.delayed((const Duration(milliseconds: 300)), () =>
                      Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: PasswordWidget(password: val,), duration: const Duration(milliseconds: 250))));*/
                    } else
                      showSnackBar(
                          context: context, message: 'password does not match');
                  }
                }
                textFourthFocusNode.unfocus();
              }
            }
            if (val.isEmpty) {
              _password = _password.substring(0, _password.length - 1);
              if (index == 1) textFirstFocusNode.unfocus();
              if (index == 2) textFirstFocusNode.requestFocus();
              if (index == 3) textSecondFocusNode.requestFocus();
              if (index == 4) textThirdFocusNode.unfocus();
            }
          },
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
          showCursor: false,
        ),
      );

  Widget _closeBox() => Container(
        width: 24,
        height: 20.87,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ]),
        child: Center(
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.clear,
              size: 15,
              color: Color.fromRGBO(96, 108, 103, 1),
            ),
          ),
        ),
      );
}
