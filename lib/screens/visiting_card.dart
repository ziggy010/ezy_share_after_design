import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitingCard extends StatelessWidget {
  static const String id = 'VisitingCard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        elevation: 0,
        title: Text(
          'Visiting Card',
          style: kNavbarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Hero(
              tag: 'card',
              child: Container(
                height: 192.h,
                width: 312.w,
                decoration: BoxDecoration(
                  color: kNavbarColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 42.h,
                  width: 144.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E3FF),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Update Design',
                      style: TextStyle(
                        color: kNavbarColor,
                        fontFamily: 'manrope',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42.h,
                  width: 144.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E3FF),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Edit Information',
                      style: TextStyle(
                        color: kNavbarColor,
                        fontFamily: 'manrope',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
            Expanded(
              child: Container(
                height: 362.h,
                width: 312.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    children: [
                      Text(
                        'Share your card',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44.w),
                        child: Text(
                          'Scan this QR code to add this card to your account',
                          style: TextStyle(
                            color: Color(0x60211F30),
                            fontFamily: 'manrope',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Image.asset(
                        'lib/images/qr-code.png',
                        height: 160,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
