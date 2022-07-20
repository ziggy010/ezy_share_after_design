import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class QrContent extends StatelessWidget {
  final String text;

  QrContent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Container(
        height: 48.h,
        width: 155.w,
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: kNavbarColor,
              fontFamily: 'manrope',
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
