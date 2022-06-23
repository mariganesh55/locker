import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/home/presentation/widgets/grid_tile_widget.dart';
import 'package:locker/features/lockers/data/datasource/locker_datasource.dart';
import 'package:locker/features/lockers/presentation/getX/locker_controller.dart';

import '../../../lockers/data/model/all_locker_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMyLockersOnly = false;
  void refresh() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            //locker status
            const SizedBox(
              height: 56,
            ),
            Container(
              height: 53,
              width: size.width,
              decoration:
                  const BoxDecoration(color: AppColors.scaffoldBG, boxShadow: [
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
                  'Locker Status',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey),
                ),
              ),
            ),
            //filter
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'My Lockers',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey),
                  ),
                  Spacer(),
                  Checkbox(
                      activeColor: AppColors.lightGreen,
                      value: showMyLockersOnly,
                      onChanged: (s) => setState(() => showMyLockersOnly = s!)),
                ],
              ),
            ),
            //grid view
            Expanded(
                child: GetBuilder<LockerController>(
                    builder: (controller) =>
                        StreamBuilder<List<AllLockerResponse>>(
                            stream: Stream.periodic(Duration(seconds: 2))
                                .asyncMap((i) =>
                                    LockerDatasource().getAllLockerDetails()),
                            builder: (builder, snapShot) {
                                print("object response -> ${snapShot.data} =? ${snapShot.hasData}");
                              if (snapShot.hasData) {

                                                                print(AppHelpers.SHARED_PREFERENCES
                                    .getString('user'));
                                List<AllLockerResponse> lockersList = [];
                                if (showMyLockersOnly) {
                                  for (var locker in snapShot.data!) {
                                    print(locker);
                                    if (locker.user ==
                                        AppHelpers.SHARED_PREFERENCES
                                            .getString('user')) {
                                      lockersList.add(locker);
                                    }
                                  }
                                } else {
                                  lockersList = snapShot.data!;
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
                                            from: 'Home',
                                            data: lockersList[index],
                                          )),
                                );
                              }

                              if (snapShot.hasError)
                                return Center(
                                    // child: Text(snapShot.error.toString()));
                                    child: Text("snapShot.error".toString()));

                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.colorPink,
                                  strokeWidth: 2,
                                ),
                              );
                            })))
          ],
        ),
      ),
    );
  }
}
