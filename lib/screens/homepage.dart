import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:flutter_swiper/flutter_swiper.dart';

class Homepage extends StatelessWidget {
  static const String id = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 70,
          right: 24,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Bibek',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'manrope',
                        color: Color(0x55211F30),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'manrope',
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36.h,
            ),
            Container(
              height: 30.h,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Text(
                      'Visiting Card',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'Passport',
                      style: TextStyle(
                        color: Color(0x34211F30),
                        fontFamily: 'manrope',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'Citizenship',
                      style: TextStyle(
                        color: Color(0x34211F30),
                        fontFamily: 'manrope',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Container(
              height: 3.h,
              width: 55.w,
              color: Color(0xFF7B66FF),
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
