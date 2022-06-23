import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_controllers.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/lockers/data/model/locker_history_response.dart';
import 'package:locker/features/lockers/presentation/pages/add_locker_screen.dart';
import 'package:locker/features/login/presentation/pages/login_home_screen.dart';
import 'package:page_transition/page_transition.dart';

class HistoryDetailsWidget extends StatefulWidget {
  final int lockerNumber;
  final LockerHistoryResponse response;
  const HistoryDetailsWidget(
      {Key? key, required this.lockerNumber, required this.response})
      : super(key: key);

  @override
  _HistoryDetailsWidgetState createState() => _HistoryDetailsWidgetState();
}

class _HistoryDetailsWidgetState extends State<HistoryDetailsWidget> {
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
                              'Locker History',
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
                                    Image.asset(
                                      'assets/common/lock.png',
                                      height: 47,
                                      width: 47,
                                    ),
                                    const SizedBox(width: 28),
                                    SizedBox(
                                      height: 44,
                                      width: 82,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${widget.response.name}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textGrey)),
                                          const Text('Details',
                                              style: TextStyle(
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
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //date
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Date: ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textGrey)),
                                        TextSpan(
                                            text:
                                                '${widget.response.time!.split(',')[0]}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textGrey))
                                      ])),
                                      //time
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: 'Timing: ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textGrey)),
                                        TextSpan(
                                            text:
                                                '${widget.response.time!.split(',')[1]}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textGrey))
                                      ])),
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
                      ],
                    ),
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
}
