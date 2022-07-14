import 'package:ezy_share_got_design/components/reusable_button.dart';
import 'package:ezy_share_got_design/components/text_fields.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:ezy_share_got_design/screens/register_screen.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passwordReveal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Let\'s sign you in.',
                    style: kSignInHeadText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome back',
                    style: kSignInSubText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You\'ve been missed.',
                    style: kSignInSubText,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  ReusableTextField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Phone,email or username',
                      labelText: 'Phone,email or username',
                      onChanged: (value) {
                        print(value);
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  ReusableTextField(
                    icon: GestureDetector(
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
                    ObscureText: passwordReveal ? true : false,
                    hintText: 'Password',
                    labelText: 'Password',
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
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
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                            height: 65,
                            child: ReusableButton(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage())),
                              specificColor: Color(0xFF585CE5),
                              specificText: 'Sign in',
                              textStyle: kSigninButtonText,
                              width: 300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
