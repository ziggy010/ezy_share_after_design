import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileContainers extends StatelessWidget {
  final String prefixIcon;
  final String contentTitle;
  final VoidCallback? onTap;

  ProfileContainers({
    required this.prefixIcon,
    required this.contentTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50.h,
          width: 312.w,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/icons/$prefixIcon.png',
                      color: Color(0xFF585664),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      contentTitle,
                      style: TextStyle(
                        color: Color(0xFF585664),
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Color(0xFF585664),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
