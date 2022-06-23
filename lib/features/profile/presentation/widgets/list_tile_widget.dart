import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/features/lockers/data/model/locker_history_response.dart';
import 'package:page_transition/page_transition.dart';

import 'history_details_widget.dart';

class ListTileWidget extends StatefulWidget {
  final LockerHistoryResponse response;
  final int index;

  const ListTileWidget({Key? key, required this.index, required this.response})
      : super(key: key);

  @override
  _ListTileWidgetState createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
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
    Size size = MediaQuery.of(context).size;
    return AnimatedPadding(
        padding: !_animate
            ? EdgeInsets.only(
                left: widget.index % 2 == 0 ? size.width : 0,
                right: widget.index % 2 != 0 ? size.width : 0)
            : const EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
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
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: HistoryDetailsWidget(
                        lockerNumber: widget.index,
                        response: widget.response,
                      ),
                      duration: const Duration(milliseconds: 250))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 33,
                  ),
                  Image.asset(
                    'assets/common/logo.png',
                    height: 30,
                    width: 30,
                    color: AppColors.colorTextGreen,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '${widget.response.name}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Color(0XFF9098B1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        duration: const Duration(milliseconds: 300));
  }
}
