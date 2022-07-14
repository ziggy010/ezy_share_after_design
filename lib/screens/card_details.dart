import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/reusable_button.dart';

class CardScreen extends StatelessWidget {
  static const String id = 'cardScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, top: 70.h),
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
                            'Fill all your details',
                            style:
                                kRegBodyTextStyle.copyWith(letterSpacing: 3.0),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'For your new',
                            style: kRegWelcomeText.copyWith(letterSpacing: 3.0),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Business card.',
                            style: kRegWelcomeText.copyWith(letterSpacing: 3.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: Container(
                    child: Column(
                      children: [
                        ReusableTextField(
                          hintText: 'First name',
                          labelText: 'First name',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Middle name',
                          labelText: 'Middle name',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Last name',
                          labelText: 'Last name',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Profession',
                          labelText: 'Profession',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Company name',
                          labelText: 'Company name',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Designation',
                          labelText: 'Designation',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Contact number',
                          labelText: 'Contact number',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReusableTextField(
                          hintText: 'Email',
                          labelText: 'Email',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Column(
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
                                style: kBodySmallText.copyWith(
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
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 50.h,
                      ),
                      child: ReusableButton(
                        specificText: 'Register',
                        specificColor: Color(0xFF585CE5),
                        textStyle: kCardButtonText,
                        width: 300.w,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
