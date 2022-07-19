import 'package:EzyShare/components/text_fields.dart';
import 'package:EzyShare/constants.dart';
import 'package:EzyShare/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/reusable_button.dart';

class CardScreen extends StatelessWidget {
  static const String id = 'cardScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, top: 0.h),
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
                            height: 5.h,
                          ),
                          Text(
                            'Business card',
                            style: kRegWelcomeText.copyWith(letterSpacing: 3.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: Container(
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.only(right: 220.h),
                        //   child: Text(
                        //     'All field are required to be filled',
                        //     style: kRegReqText.copyWith(letterSpacing: 0),
                        //   ),
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ReusableTextField(
                          hintText: 'Full name*',
                          labelText: 'Full name',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        ReusableTextField(
                          hintText: 'Profession*',
                          labelText: 'Profession',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        ReusableTextField(
                          hintText: 'Company name*',
                          labelText: 'Company name',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        ReusableTextField(
                          hintText: 'Designation*',
                          labelText: 'Designation',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        ReusableTextField(
                          hintText: 'Contact number*',
                          labelText: 'Contact number',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        ReusableTextField(
                          hintText: 'Email*',
                          labelText: 'Email',
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 50.h,
                // ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Center(
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
                                    color: Color(0xFF585CE5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 26.w),
                      child: ReusableButton(
                        specificText: 'Register',
                        specificColor: Color(0xFF585CE5),
                        textStyle: kCardButtonText,
                        width: 300.w,
                        onTap: () {},
                      ),
                    ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
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
