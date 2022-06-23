import 'package:flutter/material.dart';
import 'package:locker/core/app_colors.dart';
import 'package:locker/core/app_helpers.dart';
import 'package:locker/features/lockers/presentation/pages/new_locker_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../lockers/data/model/all_locker_response.dart';

class GridTileWidget extends StatefulWidget {
  final int index;
  final String from;
  final AllLockerResponse data;
  const GridTileWidget(
      {Key? key, required this.index, required this.data, required this.from})
      : super(key: key);

  @override
  _GridTileWidgetState createState() => _GridTileWidgetState();
}

class _GridTileWidgetState extends State<GridTileWidget> {
  bool _animate = false;

  static bool _isStart = true;

  String getStatus(String? userEmail) {
    if (userEmail == '')
      return 'Available';
    else if (userEmail == AppHelpers.SHARED_PREFERENCES.getString('user'))
      return 'Owned';
    else if (userEmail != AppHelpers.SHARED_PREFERENCES.getString('user'))
      return 'Occupied';
    else
      return 'Reserved';
  }

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
    String status = getStatus(widget.data.user);
    return Center(
      child: AnimatedPadding(
          padding: !_animate
              ? EdgeInsets.only(
                  right: widget.index % 2 == 0 ? size.width : 0,
                  left: widget.index % 2 != 0 ? size.width : 0)
              : const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              if (status == 'Available' || status == 'Owned') {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: NewLockerScreen(
                          response: widget.data,
                          status: status,
                          from: widget.from,
                        ),
                        duration: const Duration(milliseconds: 250)));
              }
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: size.width * 0.35,
                width: size.width * 0.35,
                decoration: BoxDecoration(
                    color: (status == 'Available' || status == 'Owned')
                        ? widget.data.status != 'open'
                            ? Colors.red
                            : AppColors.lightGreen
                        : AppColors.scaffoldBG,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: widget.data.status != 'open'
                            ? AppColors.colorRed
                            : AppColors.lightGreen,
                        width: 1),
                    boxShadow: AppHelpers.boxShadowList),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Image.asset('assets/common/lock.png',
                        height: 44,
                        width: 44,
                        color:
                            // widget.data.status == 'open'
                            // ?
                            Colors.white
                        // : Colors.red /*: const Color(0xFF3AAE3A)*/,
                        ),
                    const SizedBox(
                      height: 1.1,
                    ),
                    Text(
                      widget.data.name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey),
                    ),
                    const SizedBox(
                      height: 5.77,
                    ),
                    Text(
                      status,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey),
                    )
                  ],
                ),
              ),
            ),
          ),
          duration: const Duration(milliseconds: 300)),
    );
  }
}
