import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ezy_share_got_design/constants.dart';

import '../../constants.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Want to stack all your business card in one place? ',
                  style: kNavbarText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_qmfs6c3i.json',
                height: 380.h,
                errorBuilder: (context, error, stackTrace) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      '*Error loading image*, connect to internet.',
                      style: kNavbarText,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
