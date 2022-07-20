import 'package:ezy_share_got_design/card_designs/card_design2.dart';
import 'package:ezy_share_got_design/components/saved_cards_data.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/components/saved_cards_data.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/components/saved_cards_data.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedCardNewPage extends StatelessWidget {
  final SavedCardData savedCardData;

  SavedCardNewPage({required this.savedCardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        title: Text(
          savedCardData.title,
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CardDesign2(
                    companyName: savedCardData.companyName,
                    fullname: savedCardData.title,
                    phoneNumber: savedCardData.phoneNumber,
                    email: savedCardData.email,
                    webiste: savedCardData.website,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 42.h,
                      width: 73.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFE2E3FF),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Call',
                          style: TextStyle(
                            color: kNavbarColor,
                            fontFamily: 'poppins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 42.h,
                      width: 73.w,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color(0xFFE2E3FF),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: kNavbarColor,
                            fontFamily: 'poppins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 42.h,
                  width: 92.w,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: Color(0xFFFF6D6D),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Color(0xFFFF6D6D),
                        fontFamily: 'poppins',
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
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 225, 225, 235),
                        spreadRadius: 1,
                        blurRadius: 18,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    children: [
                      Text(
                        'Share your card',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'poppins',
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
                            fontFamily: 'poppins',
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
