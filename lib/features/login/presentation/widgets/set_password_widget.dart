import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/features/home/presentation/pages/home_screen_main.dart';
import 'package:page_transition/page_transition.dart';

class SetPasswordWidget extends StatefulWidget {
  const SetPasswordWidget({Key? key}) : super(key: key);

  @override
  _SetPasswordWidgetState createState() => _SetPasswordWidgetState();
}

class _SetPasswordWidgetState extends State<SetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/login/image2.png', height: size.height, width: size.width, fit: BoxFit.cover,),
          //bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 325,
              width: size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.boxGradient, begin: Alignment.topCenter, end: Alignment.bottomCenter)
              ),
              child: Column(
                children: [
                  //text 1
                  const SizedBox(height: 49,),
                  const Text('SET A PASSWORD', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white),),
                  //text 2
                  const SizedBox(height: 25,),
                  const SizedBox(width: 345,child: Text('The password for the Locker can be set throughout the mobile application ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white), textAlign: TextAlign.center,)),
                  //indicator
                  const SizedBox(height: 51),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      //2nd indicator
                      const SizedBox(width: 23,),
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                          child: Container(
                            height: 9,
                            width: 9,
                            decoration: BoxDecoration(
                                color: AppColors.pink,
                                border: Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //next
                  const SizedBox(height: 37),
                  InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const HomeScreenMain(),
                            duration: const Duration(
                                milliseconds: 250)), (Route<dynamic> route) => false),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_forward, color: AppColors.pink, size: 24,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
