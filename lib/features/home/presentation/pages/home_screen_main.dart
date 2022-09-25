import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_controllers.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/login/presentation/pages/login_home_screen.dart';
import 'package:locker/features/profile/presentation/pages/profile_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'home_screen.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  _HomeScreenMainState createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: PageView(
                controller: AppControllers.homeController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) => setState(() => _index = page),
                children: const [HomeScreen(), Text(''), ProfileScreen()],
              )),
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
                      onTap: () => AppControllers.homeController.jumpToPage(0),
                      child: Container(
                        height: 33.94,
                        width: 87,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.scaffoldBG,
                            boxShadow: _index == 0
                                ? AppHelpers.bottomNavigatorShadowList
                                : []),
                        child: Row(
                          mainAxisAlignment: _index == 0
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.home_outlined,
                              size: 30,
                              color: _index == 0
                                  ? AppColors.colorTextGreen
                                  : Colors.white,
                            ),
                            const SizedBox(
                              width: 9.7,
                            ),
                            if (_index == 0)
                              const Text(
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
                                          boxShadow: _index == 2
                                              ? AppHelpers
                                                  .bottomNavigatorShadowList
                                              : []),
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 48),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                //no
                                                InkWell(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child: Container(
                                                    width: 90,
                                                    height: 27,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .colorGreen,
                                                          width: 1),
                                                      boxShadow: AppHelpers
                                                          .boxShadowList,
                                                      color:
                                                          AppColors.scaffoldBG,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'No',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .textGrey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                //yes
                                                InkWell(
                                                  onTap: () {
                                                    AppHelpers
                                                        .SHARED_PREFERENCES
                                                        .clear();
                                                    Navigator.pushAndRemoveUntil(
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
                                                            false);
                                                  },
                                                  child: Container(
                                                    width: 90,
                                                    height: 27,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .colorGreen,
                                                          width: 1),
                                                      boxShadow: AppHelpers
                                                          .boxShadowList,
                                                      color:
                                                          AppColors.scaffoldBG,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                          mainAxisAlignment: _index == 1
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 7.78,
                            ),
                            Icon(
                              Icons.logout,
                              size: 30,
                              color: _index == 1
                                  ? AppColors.colorTextGreen
                                  : Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //account
                    InkWell(
                      onTap: () => AppControllers.homeController.jumpToPage(2),
                      child: Container(
                        height: 33.94,
                        // width: 87,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.scaffoldBG,
                            boxShadow: _index == 2
                                ? AppHelpers.bottomNavigatorShadowList
                                : []),
                        child: Row(
                          mainAxisAlignment: _index == 2
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 7.78,
                            ),
                            Icon(
                              Icons.account_circle_outlined,
                              size: 30,
                              color: _index == 2
                                  ? AppColors.colorTextGreen
                                  : Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            if (_index == 2)
                              const Text(
                                'My Profile',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.colorTextGreen),
                              ),
                            const SizedBox(
                              width: 7.78,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          //add button
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 78.0),
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             PageTransition(
          //               child: AddLockersScreen(),
          //               type: PageTransitionType.fade,
          //             ));
          //       },
          //       child: Container(
          //         height: 69,
          //         width: 69,
          //         decoration: BoxDecoration(
          //             color: AppColors.scaffoldBG,
          //             borderRadius: BorderRadius.circular(100),
          //             boxShadow: const [
          //               BoxShadow(
          //                   color: Color.fromRGBO(27, 27, 27, 0.9),
          //                   blurRadius: 25,
          //                   offset: Offset(10, 10)),
          //               BoxShadow(
          //                   color: Color.fromRGBO(55, 55, 55, 0.9),
          //                   blurRadius: 20,
          //                   offset: Offset(-10, -10)),
          //               BoxShadow(
          //                   color: Color.fromRGBO(27, 27, 27, 0.2),
          //                   blurRadius: 20,
          //                   offset: Offset(10, -10)),
          //               BoxShadow(
          //                   color: Color.fromRGBO(27, 27, 27, 0.2),
          //                   blurRadius: 20,
          //                   offset: Offset(-10, 10)),
          //               BoxShadow(
          //                   color: Color.fromRGBO(27, 27, 27, 0.5),
          //                   blurRadius: 2,
          //                   blurStyle: BlurStyle.inner,
          //                   offset: Offset(-1, -1)),
          //               BoxShadow(
          //                   color: Color.fromRGBO(55, 55, 55, 0.3),
          //                   blurRadius: 2,
          //                   blurStyle: BlurStyle.inner,
          //                   offset: Offset(1, 1)),
          //             ]),
          //         child: const Center(
          //           child: Icon(
          //             Icons.add,
          //             size: 45,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
