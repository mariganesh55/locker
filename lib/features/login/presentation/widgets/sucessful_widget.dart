import 'package:flutter/material.dart';

class SucessfulWidget extends StatelessWidget {
  const SucessfulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), (){
      Navigator.pop(context);
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(child: Container(
        width: 345,
        height: 156,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ]
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/common/correct.png', width: 63, height: 63,),
              const SizedBox(height: 6,),
              const Text('Password Changed', style: TextStyle(color: Color.fromRGBO(34, 42, 39, 1), fontWeight: FontWeight.w400, fontSize: 24),)
            ],
          ),
        ),
      ),),
      backgroundColor: Colors.transparent,
    );
  }
}
