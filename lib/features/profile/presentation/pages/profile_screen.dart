import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/features/lockers/presentation/widgets/password_widget.dart';
import 'package:locker/features/profile/presentation/pages/locker_history_screen.dart';
import 'package:locker/features/profile/presentation/pages/my_lockers_screen.dart';
import 'package:locker/features/profile/presentation/pages/my_profile_screen.dart';
import 'package:locker/features/profile/presentation/widgets/list_tile_widget.dart';
import 'package:locker/features/profile/presentation/widgets/profile_options_widget.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldBG,
      body: SizedBox(
        height: size.height,
        width: size.width,
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
                    'My Profile',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey),
                  ),
                ),
              ),
              //list
              const SizedBox(
                height: 68,
              ),
              //locker history
              ProfileOptionsWidget(
                index: 0,
                title: 'Locker History',
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      child: LockerHistoryScreen(),
                      type: PageTransitionType.fade,
                    )),
              ),
              ProfileOptionsWidget(
                index: 1,
                title: 'My Profile',
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      child: MyProfileScreen(),
                      type: PageTransitionType.fade,
                    )),
              ),
              ProfileOptionsWidget(
                index: 2,
                title: 'My Lockers',
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      child: MyLockersScreen(),
                      type: PageTransitionType.fade,
                    )),
              ),
              ProfileOptionsWidget(
                  index: 3,
                  title: 'Create / Change Pass code',
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const PasswordWidget(changePassCode: true,),
                            duration: const Duration(milliseconds: 250)));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
