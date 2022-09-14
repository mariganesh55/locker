import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_controllers.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/home/presentation/widgets/grid_tile_widget.dart';
import 'package:locker/features/lockers/data/datasource/locker_datasource.dart';
import 'package:locker/features/lockers/data/model/all_locker_response.dart';
import 'package:locker/features/lockers/presentation/getX/locker_controller.dart';
import 'package:locker/features/login/presentation/pages/login_home_screen.dart';
import 'package:page_transition/page_transition.dart';

class AddLockersScreen extends StatefulWidget {
  const AddLockersScreen({Key? key}) : super(key: key);

  @override
  _AddLockersScreenState createState() => _AddLockersScreenState();
}

class _AddLockersScreenState extends State<AddLockersScreen> {
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
                        'Add Lockers',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey),
                      ),
                    ),
                  ),
                  //grid view
                  Expanded(
                      child: GetBuilder<LockerController>(
                          builder: (controller) => StreamBuilder<
                                  List<AllLockerResponse>>(
                              stream: Stream.periodic(Duration(seconds: 2))
                                  .asyncMap((i) =>
                                      LockerDatasource().getAllLockerDetails()),
                              builder: (builder, snapShot) {
                                if (snapShot.hasData) {
                                  print(AppHelpers.SHARED_PREFERENCES
                                      .getString('user'));
                                  List<AllLockerResponse> lockersList = [];
                                  for (var locker in snapShot.data!) {
                                    print(locker);
                                    if (locker.user == '' ||
                                        locker.user == "null") {
                                      lockersList.add(locker);
                                    }
                                  }
                                  if (lockersList.length == 0) {
                                    return Center(
                                      child: Text(
                                        'No Lockers Available',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  }
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.025,
                                        right: size.width * 0.025),
                                    child: GridView.builder(
                                        itemCount: lockersList.length,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1,
                                        ),
                                        itemBuilder: (itemBuilder, index) =>
                                            GridTileWidget(
                                              index: index,
                                              from: 'Add',
                                              data: lockersList[index],
                                            )),
                                  );
                                }

                                if (snapShot.hasError)
                                  return Center(
                                      child: Text(snapShot.error.toString()));

                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.colorPink,
                                    strokeWidth: 2,
                                  ),
                                );
                              }))),
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
                          onTap: () {
                            AppControllers.homeController.jumpToPage(2);
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
                                Icon(Icons.account_circle_outlined,
                                    size: 30, color: Colors.white),
                                SizedBox(
                                  width: 9.7,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () => Navigator.pop(context),
                        //   child: Container(
                        //     height: 33.94,
                        //     // width: 87,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(5),
                        //         color: AppColors.scaffoldBG,
                        //         boxShadow:
                        //             AppHelpers.bottomNavigatorShadowList),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: const [
                        //         SizedBox(
                        //           width: 7.78,
                        //         ),
                        //         Icon(Icons.account_circle_outlined,
                        //             size: 30, color: Colors.white),
                        //         SizedBox(
                        //           width: 4,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                          color: AppColors.colorTextGreen,
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
