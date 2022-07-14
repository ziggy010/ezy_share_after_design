import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Container(
            height: 198.h,
            width: 312.w,
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: Container(
            height: 182.h,
            width: 296.w,
            decoration: BoxDecoration(
              color: Color(0x10000000),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
