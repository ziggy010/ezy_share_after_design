import 'package:ezy_share_got_design/components/reusable_button.dart';
import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String id = 'ForgotPasswordScreen';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: const Color(0xFFE2E3FF),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter your email to reset password",
        labelText: "Enter your email to reset password",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE2E3FF)),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade200,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email.");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xFF585CE5),
      child: SizedBox(
        height: 60.h,
        width: 300.w,
        child: MaterialButton(
          elevation: 0,
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            _auth.sendPasswordResetEmail(email: emailController.text);
            Fluttertoast.showToast(
                msg: "Email has been sent to the entered email address.");
            Navigator.of(context).pop();
          },
          child: Text(
            "Send me a link!",
            textAlign: TextAlign.center,
            style: kSigninButtonText,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 16.w,
          bottom: 16.h,
          top: 20.h,
        ),
        child: Form(
          key: _formKey,
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
              emailField,
              SizedBox(
                height: 20.h,
              ),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
