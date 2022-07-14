import 'package:ezy_share_got_design/components/reusable_button.dart';
import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/card_details.dart';
import 'package:ezy_share_got_design/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = 'registerScreen';

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Discover your new,',
                        style:
                            kRegBodyTextStyle.copyWith(letterSpacing: 3.0.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Business card.',
                        style: kRegWelcomeText.copyWith(letterSpacing: 3.0.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Container(
                child: Column(
                  children: [
                    ReusableTextField(
                      hintText: 'Fullname',
                      labelText: 'Fullname',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReusableTextField(
                      hintText: 'Phone number',
                      labelText: 'Phone number',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReusableTextField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      labelText: 'Email',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReusableTextField(
                      hintText: 'Address',
                      labelText: 'Address',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReusableTextField(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      ObscureText: true,
                      hintText: 'Password',
                      labelText: 'Password',
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignIn.id);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: kRegBodySmallText,
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: kRegBodySmallText.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReusableButton(
                      specificText: 'More',
                      specificColor: Color(0xFF585CE5),
                      textStyle: kRegButtonText,
                      width: 300.w,
                      onTap: () {
                        Navigator.pushNamed(context, CardScreen.id);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
