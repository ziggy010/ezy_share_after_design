import 'package:ezy_share_got_design/components/reusable_button.dart';
import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:ezy_share_got_design/screens/authentication/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signin';
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passwordReveal = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: const Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Phone,email or username",
        labelText: 'Phone,email or username',
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
          return ("Please enter your email id.");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email id.");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    final passwordField = TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: const Color(0xFFE2E3FF),
        filled: true,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              passwordReveal = !passwordReveal;
            });
          },
          child: Icon(
            passwordReveal
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: 'Password',
        labelText: 'Password',
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: passwordController,
      obscureText: passwordReveal ? false : true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login.");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid password having minimum 6 character).");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );
    final loginButton = Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(20.r),
      color: const Color(0xFF585CE5),
      child: SizedBox(
        height: 60.h,
        width: 300.w,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: kSigninButtonText,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Let\'s sign you in.',
                  style: kSignInHeadText,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Welcome back',
                  style: kSignInSubText,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'You\'ve been missed.',
                  style: kSignInSubText,
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  emailField,
                  SizedBox(
                    height: 25.h,
                  ),
                  passwordField,
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Don\'t have an account?  ',
                            style: kSigninBodySmallText,
                            children: [
                              TextSpan(
                                text: 'Register',
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
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                    ),
                    loginButton,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
                  child: SpinKitFadingGrid(
                size: 100,
                color: Color(0xFF585CE5),
              )));
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Homepage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "Error / No internet connection.";
        }
        Fluttertoast.showToast(msg: errorMessage!);

        print(error.code);
      }
    }
  }
}
