import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_controllers.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/lockers/presentation/pages/add_locker_screen.dart';
import 'package:locker/features/login/presentation/pages/login_home_screen.dart';
import 'package:page_transition/page_transition.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? email;
  String? name;

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
                        'Profile Details',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FutureBuilder<void>(
                          future: getDataFromPreference(),
                          builder: (context, snapshot) {
                            if (email != null && name != null) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  infoRowWidget(
                                      label: 'Name', value: name ?? ''),
                                  // infoRowWidget(
                                  //     label: 'Last Name', value: data.username),
                                  infoRowWidget(
                                      label: 'Email', value: email ?? ''),
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.colorPink,
                                  strokeWidth: 2,
                                ),
                              );
                            }

                            // if (snapshot.hasData) {
                            //   return Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 40,
                            //       ),
                            //       infoRowWidget(label: 'Name', value: name),
                            //       // infoRowWidget(
                            //       //     label: 'Last Name', value: data.username),
                            //       infoRowWidget(label: 'Email', value: email),
                            //     ],
                            //   );
                            // }
                            // if (snapshot.hasError) {
                            //   return Text(
                            //     'Error loading data',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w500,
                            //         color: Colors.white,
                            //         fontSize: 20),
                            //   );
                            // }
                            // return const Center(
                            //   child: CircularProgressIndicator(
                            //     color: AppColors.colorPink,
                            //     strokeWidth: 2,
                            //   ),
                            // );
                          }),
                    ),

                    //   FutureBuilder<List<UserDetailsResponse>>(
                    //       future: UserDetailsDataSource.getUserDetails(
                    //           AppHelpers.SHARED_PREFERENCES.getString('user') ??
                    //               ''),
                    //       builder: (context, snapshot) {
                    //         if (snapshot.hasData) {
                    //           var data = snapshot.data![0];
                    //           return Column(
                    //             children: [
                    //               SizedBox(
                    //                 height: 40,
                    //               ),
                    //               infoRowWidget(
                    //                   label: 'First Name',
                    //                   value: data.username),
                    //               infoRowWidget(
                    //                   label: 'Last Name', value: data.username),
                    //               infoRowWidget(
                    //                   label: 'Email', value: data.email),
                    //             ],
                    //           );
                    //         }
                    //         if (snapshot.hasError) {
                    //           return Text(
                    //             'Error loading data',
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.white,
                    //                 fontSize: 20),
                    //           );
                    //         }
                    //         return const Center(
                    //           child: CircularProgressIndicator(
                    //             color: AppColors.colorPink,
                    //             strokeWidth: 2,
                    //           ),
                    //         );
                    //       }),
                    // ),
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
                          onTap: () {
                            AppControllers.homeController.jumpToPage(0);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 33.94,
                            width: 87,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.scaffoldBG,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(Icons.home_outlined,
                                    size: 30, color: Colors.white),
                                SizedBox(
                                  width: 9.7,
                                ),
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
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 33.94,
                            // width: 87,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.scaffoldBG,
                                boxShadow:
                                    AppHelpers.bottomNavigatorShadowList),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 7.78,
                                ),
                                Icon(Icons.account_circle_outlined,
                                    size: 30, color: AppColors.colorTextGreen),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'My Profile',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colorTextGreen),
                                ),
                                SizedBox(
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 78.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: AddLockersScreen(),
                            type: PageTransitionType.fade,
                          ));
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
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 45,
                          color: Colors.white,
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

  Widget infoRowWidget({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                )),
          ),
          Text(
            '   :   ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                ),
              ))
        ],
      ),
    );
  }

  Future<void> getDataFromPreference() async {
    email = AppHelpers.SHARED_PREFERENCES.getString('user') ?? '';
    name = AppHelpers.SHARED_PREFERENCES.getString('name') ?? '';
  }
}
