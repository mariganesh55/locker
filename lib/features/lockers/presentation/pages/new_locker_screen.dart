import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_controllers.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/core/getx_controllers.dart';
import 'package:locker/core/show_snackbar.dart';
import 'package:locker/features/lockers/data/datasource/locker_datasource.dart';
import 'package:locker/features/lockers/presentation/widgets/password_widget.dart';
import 'package:locker/features/login/presentation/pages/login_home_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../data/model/all_locker_response.dart';
import 'add_locker_screen.dart';

class NewLockerScreen extends StatefulWidget {
  final AllLockerResponse response;
  final String status;
  final String from;
  const NewLockerScreen(
      {Key? key,
      required this.response,
      required this.from,
      required this.status})
      : super(key: key);

  @override
  _NewLockerScreenState createState() => _NewLockerScreenState();
}

class _NewLockerScreenState extends State<NewLockerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldBG,
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //locker status
                          const SizedBox(
                            height: 56,
                          ),
                          Container(
                            height: 53,
                            width: size.width,
                            decoration: const BoxDecoration(
                                color: AppColors.scaffoldBG,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(21, 21, 21, 0.9),
                                      blurRadius: 13,
                                      offset: Offset(5, 5)),
                                  BoxShadow(
                                      color: Color.fromRGBO(62, 62, 62, 0.9),
                                      blurRadius: 10,
                                      offset: Offset(-5, -5)),
                                  BoxShadow(
                                      color: Color.fromRGBO(21, 21, 21, 0.2),
                                      blurRadius: 10,
                                      offset: Offset(5, -5)),
                                  BoxShadow(
                                      color: Color.fromRGBO(21, 21, 21, 0.2),
                                      blurRadius: 10,
                                      offset: Offset(-5, 5)),
                                  BoxShadow(
                                      color: Color.fromRGBO(21, 21, 21, 0.5),
                                      blurRadius: 2,
                                      blurStyle: BlurStyle.inner,
                                      offset: Offset(-1, -1)),
                                  BoxShadow(
                                      color: Color.fromRGBO(62, 62, 62, 0.3),
                                      blurRadius: 2,
                                      blurStyle: BlurStyle.inner,
                                      offset: Offset(1, 1)),
                                ]),
                            child: const Center(
                              child: Text(
                                'Lockers Occupied',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGrey),
                              ),
                            ),
                          ),
                          //locker container
                          const SizedBox(height: 84),
                          Padding(
                            padding: const EdgeInsets.only(left: 33, right: 38),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.colorGreen, width: 1),
                                  color: AppColors.scaffoldBG,
                                  boxShadow: AppHelpers.boxShadowList),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 33,
                                      ),
                                      if (widget.response.status != 'open')
                                        Image.asset(
                                          'assets/common/lock.png',
                                          height: 47,
                                          width: 47,
                                          color: Colors.red,
                                        ),
                                      if (widget.response.status == 'open')
                                        Image.asset(
                                          'assets/common/lock.png',
                                          height: 47,
                                          width: 47,
                                        ),
                                      const SizedBox(width: 28),
                                      SizedBox(
                                        height: 44,
                                        // width: 82,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(widget.response.name,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.textGrey)),
                                            Text(
                                                widget.response.status == 'open'
                                                    ? 'Open'
                                                    : 'Locked',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.textGrey))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  //open close buttons
                                  const SizedBox(height: 40),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          widget.response.status != 'open' &&
                                                  widget.response.user ==
                                                      AppHelpers
                                                          .SHARED_PREFERENCES
                                                          .getString('user')
                                              ? MainAxisAlignment.spaceBetween
                                              : MainAxisAlignment.center,
                                      children: [
                                        //add locker
                                        if (widget.status == 'Available')
                                          InkWell(
                                            onTap: () {
                                              print(
                                                  'passcode ${AppHelpers.SHARED_PREFERENCES.getString('passcode')}');
                                              if (AppHelpers.SHARED_PREFERENCES
                                                          .getString(
                                                              'passcode') ==
                                                      null ||
                                                  AppHelpers.SHARED_PREFERENCES
                                                          .getString(
                                                              'passcode') ==
                                                      '') {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Set Passcode'),
                                                        content: Text(
                                                            'Go to My Profile -> Create / Change Passcode\nSet Passcode to access lockers'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('Ok'),
                                                          )
                                                        ],
                                                      );
                                                    });
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        child: PasswordWidget(
                                                          changePassCode: false,
                                                          lockerOperation:
                                                              'Add',
                                                          response:
                                                              widget.response,
                                                        ),
                                                        type: PageTransitionType
                                                            .fade));
                                              }
                                            },
                                            child: Container(
                                              width: 137,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow:
                                                    AppHelpers.boxShadowList,
                                                color: AppColors.scaffoldBG,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Add Locker',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors
                                                          .colorTextGreen),
                                                ),
                                              ),
                                            ),
                                          ),
                                        //release
                                        if (widget.response.user ==
                                            AppHelpers.SHARED_PREFERENCES
                                                .getString('user'))
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      child: PasswordWidget(
                                                        changePassCode: false,
                                                        lockerOperation:
                                                            'Release',
                                                        response:
                                                            widget.response,
                                                      ),
                                                      type: PageTransitionType
                                                          .fade));
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 40,
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.colorGreen,
                                                    width: 1),
                                                boxShadow:
                                                    AppHelpers.boxShadowList,
                                                color: AppColors.scaffoldBG,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Release',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.textGrey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        //open
                                        if (widget.response.user ==
                                            AppHelpers.SHARED_PREFERENCES
                                                .getString('user'))
                                          InkWell(
                                            onTap: () {
                                              
                                                LockerDatasource()
                                                  .unlockLocker(
                                                      widget.response.name,
                                                      widget.response.key,
                                                      widget.response
                                                          .publishTopic!,
                                                      widget.response
                                                          .subscribeTopic!)
                                                  .then((value) {
                                                if (value) {
                                                  showSnackBar(
                                                      context: Get.context!,
                                                      message:
                                                          '${widget.response.name} Unlocked successfully');
                                                  lockerController.update();
                                                  Navigator.pop(context);
                                                } else {
                                                  showSnackBar(
                                                      context: context,
                                                      message:
                                                          '${widget.response.name} Unlock failed',
                                                      bgColor: Colors.red);

                                                }
                                              });
                                                
                                              
                                              
                        
                                            },

                                            child: Container(
                                              width: 100,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.colorGreen,
                                                    width: 1),
                                                boxShadow:
                                                    AppHelpers.boxShadowList,
                                                color: AppColors.scaffoldBG,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Unlock',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .colorTextGreen),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //add locker
                          const SizedBox(height: 52),

                          // //create pass code
                          // const SizedBox(height: 79),
                          // if (widget.response.status == 'open')
                          //   InkWell(
                          //     onTap: () {
                          //       Navigator.push(
                          //           context,
                          //           PageTransition(
                          //               type: PageTransitionType.leftToRight,
                          //               child: const PasswordWidget(),
                          //               duration:
                          //                   const Duration(milliseconds: 250)));
                          //     },
                          //     child: Container(
                          //       height: 40,
                          //       width: 262,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         boxShadow: AppHelpers.boxShadowList,
                          //         color: AppColors.scaffoldBG,
                          //       ),
                          //       child: const Center(
                          //         child: Text(
                          //           'Create Pass Code',
                          //           style: TextStyle(
                          //               fontSize: 18,
                          //               fontWeight: FontWeight.w600,
                          //               color: AppColors.colorTextGreen),
                          //         ),
                          //       ),
                          //     ),
                          //   )
                        ],
                      ),
                    ),
                  ),
                  //bottom bar
                  Container(
                    height: 101,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: AppColors.scaffoldBG,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(21, 21, 21, 0.9),
                              blurRadius: 13,
                              offset: Offset(5, 5)),
                          BoxShadow(
                              color: Color.fromRGBO(62, 62, 62, 0.9),
                              blurRadius: 10,
                              offset: Offset(-5, -5)),
                          BoxShadow(
                              color: Color.fromRGBO(21, 21, 21, 0.2),
                              blurRadius: 10,
                              offset: Offset(5, -5)),
                          BoxShadow(
                              color: Color.fromRGBO(21, 21, 21, 0.2),
                              blurRadius: 10,
                              offset: Offset(-5, 5)),
                          BoxShadow(
                              color: Color.fromRGBO(21, 21, 21, 0.5),
                              blurRadius: 2,
                              blurStyle: BlurStyle.inner,
                              offset: Offset(-1, -1)),
                          BoxShadow(
                              color: Color.fromRGBO(62, 62, 62, 0.3),
                              blurRadius: 2,
                              blurStyle: BlurStyle.inner,
                              offset: Offset(1, 1)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //home
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 33.94,
                            // width: 87,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.scaffoldBG,
                                boxShadow: widget.from == 'Home'
                                    ? AppHelpers.bottomNavigatorShadowList
                                    : []),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.home_outlined,
                                  size: 30,
                                  color: widget.from == 'Home'
                                      ? AppColors.colorTextGreen
                                      : Colors.white,
                                ),
                                const SizedBox(
                                  width: 9.7,
                                ),
                                if (widget.from == 'Home')
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.colorTextGreen),
                                  )
                              ],
                            ),
                          ),
                        ),
                        //logout
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (builder) => Center(
                                      child: Card(
                                        color: Colors.transparent,
                                        child: Container(
                                          width: 326,
                                          height: 149,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.scaffoldBG,
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 27,
                                              ),
                                              const Text(
                                                'Sign Out',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.textGrey),
                                              ),
                                              const SizedBox(height: 30),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 48),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    //no
                                                    InkWell(
                                                      onTap: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Container(
                                                        width: 90,
                                                        height: 27,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .colorGreen,
                                                              width: 1),
                                                          boxShadow: AppHelpers
                                                              .boxShadowList,
                                                          color: AppColors
                                                              .scaffoldBG,
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .textGrey),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    //yes
                                                    InkWell(
                                                      onTap: () => Navigator.pushAndRemoveUntil(
                                                          context,
                                                          PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  const LoginHomeScreen(),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250)),
                                                          (Route<dynamic>
                                                                  route) =>
                                                              false),
                                                      child: Container(
                                                        width: 90,
                                                        height: 27,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .colorGreen,
                                                              width: 1),
                                                          boxShadow: AppHelpers
                                                              .boxShadowList,
                                                          color: AppColors
                                                              .scaffoldBG,
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .textGrey),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                          child: Container(
                            height: 33.94,
                            width: 87,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 7.78,
                                ),
                                Icon(
                                  Icons.logout,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //account
                        InkWell(
                          onTap: () {
                            AppControllers.homeController.jumpToPage(2);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 33.94,
                            // width: 87,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.scaffoldBG,
                                boxShadow: widget.from == 'Profile'
                                    ? AppHelpers.bottomNavigatorShadowList
                                    : []),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 7.78,
                                ),
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 30,
                                  color: widget.from == 'Profile'
                                      ? AppColors.colorTextGreen
                                      : Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                if (widget.from == 'Profile')
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.colorTextGreen),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //add button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 78.0),
                  child: InkWell(
                    onTap: () {
                      if (widget.from == 'Add') {
                        Navigator.pop(context);
                      } else {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: AddLockersScreen(),
                              type: PageTransitionType.fade,
                            ));
                      }
                    },
                    child: Container(
                      height: 69,
                      width: 69,
                      decoration: BoxDecoration(
                          color: AppColors.scaffoldBG,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(27, 27, 27, 0.9),
                                blurRadius: 25,
                                offset: Offset(10, 10)),
                            BoxShadow(
                                color: Color.fromRGBO(55, 55, 55, 0.9),
                                blurRadius: 20,
                                offset: Offset(-10, -10)),
                            BoxShadow(
                                color: Color.fromRGBO(27, 27, 27, 0.2),
                                blurRadius: 20,
                                offset: Offset(10, -10)),
                            BoxShadow(
                                color: Color.fromRGBO(27, 27, 27, 0.2),
                                blurRadius: 20,
                                offset: Offset(-10, 10)),
                            BoxShadow(
                                color: Color.fromRGBO(27, 27, 27, 0.5),
                                blurRadius: 2,
                                blurStyle: BlurStyle.inner,
                                offset: Offset(-1, -1)),
                            BoxShadow(
                                color: Color.fromRGBO(55, 55, 55, 0.3),
                                blurRadius: 2,
                                blurStyle: BlurStyle.inner,
                                offset: Offset(1, 1)),
                          ]),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 45,
                          color: widget.from == 'Add'
                              ? AppColors.colorTextGreen
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
