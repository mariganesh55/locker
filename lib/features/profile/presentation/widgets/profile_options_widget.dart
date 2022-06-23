import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locker/core/app_colors.dart';
import 'package:page_transition/page_transition.dart';

class ProfileOptionsWidget extends StatefulWidget {
  final int index;
  final String title;
  final void Function()? onTap;
  const ProfileOptionsWidget(
      {Key? key, required this.index, this.onTap, required this.title})
      : super(key: key);

  @override
  State<ProfileOptionsWidget> createState() => _ProfileOptionsWidgetState();
}

class _ProfileOptionsWidgetState extends State<ProfileOptionsWidget> {
  bool _animate = false;

  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedPadding(
        padding: !_animate
            ? EdgeInsets.only(
                left: widget.index % 2 == 0 ? size.width : 0,
                right: widget.index % 2 != 0 ? size.width : 0)
            : const EdgeInsets.all(0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 50,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              color: AppColors.scaffoldBG,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorGreen, width: 1),
              boxShadow: const [
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
          child: InkWell(
            onTap: widget.onTap,
            child: Row(
              children: [
                const SizedBox(
                  width: 33,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        duration: const Duration(milliseconds: 300));
  }
}
