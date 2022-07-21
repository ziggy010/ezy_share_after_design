import 'package:ezy_share_got_design/components/reusable_button.dart';
import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String id = 'ForgotPasswordScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 40,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 16.w,
          bottom: 16.h,
          top: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontFamily: 'poppins',
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ReusableTextField(
              hintText: 'Email address',
              labelText: 'Email address',
              onSaved: (enteredString) {
                print(enteredString);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            ReusableButton(
              specificText: 'Send instructions',
              specificColor: kNavbarColor,
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              onTap: () {},
              width: 315.w,
            ),
          ],
        ),
      ),
    );
  }
}
