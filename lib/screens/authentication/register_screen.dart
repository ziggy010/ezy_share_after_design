import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezy_share_got_design/components/reusable_button.dart';
import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/model/user_model.dart';
import 'package:ezy_share_got_design/screens/card_details.dart';
import 'package:ezy_share_got_design/screens/authentication/sign_in.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'registerScreen';
  bool isPasswordVisible = false;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();

  final fullNameEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //fullName
    final fullNameField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Full Name",
        labelText: "Full Name",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: fullNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First name cannot be empty.");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        fullNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    //Phone Number
    final phoneNumberField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Phone Number",
        labelText: "Phone Number",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone Number cannot be empty.");
        }
        return null;
      },
      onSaved: (value) {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
//Address
    final addressField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Address",
        labelText: "Address",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: addressEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Address cannot be empty.");
        }
        return null;
      },
      onSaved: (value) {
        addressEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    //Email
    final emailField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Email",
        labelText: "Email",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    //Password
    final passwordField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Password",
        labelText: "Password",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login.");
        }
        if (!regex.hasMatch(value)) {
          return ("The password you entered doesn't meet the minimum security requirements.");
        }
        return null;
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

//Confirm Password
    final confirmPasswordField = TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFE2E3FF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Confirm Password",
        labelText: "Confirm Password",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontFamily: 'poppins',
        ),
        labelStyle:
            TextStyle(color: Colors.grey.shade500, fontFamily: 'poppins'),
        floatingLabelStyle: const TextStyle(color: Colors.black),
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
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    final signUpButton = Material(
      borderRadius: BorderRadius.circular(20.r),
      color: Color(0xFF585CE5),
      child: SizedBox(
        height: 60.h,
        width: 300.w,
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              signUp(
                  emailEditingController.text, passwordEditingController.text);
            },
            child: Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Padding(
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    fullNameField,
                    SizedBox(
                      height: 20.h,
                    ),
                    phoneNumberField,
                    SizedBox(
                      height: 20.h,
                    ),
                    emailField,
                    SizedBox(
                      height: 20.h,
                    ),
                    addressField,
                    SizedBox(
                      height: 20.h,
                    ),
                    passwordField,
                    SizedBox(
                      height: 20.h,
                    ),
                    confirmPasswordField,
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.w),
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 28.w),
                    child: signUpButton,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
                  child: SpinKitFadingGrid(
                size: 100,
                color: Colors.blue,
              )));
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
            errorMessage = "Error! Too many requests....";
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

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullNameEditingController.text;
    userModel.phoneNumber = phoneNumberEditingController.text;
    userModel.address = addressEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => CardScreen()),
        (route) => false);
  }
}
