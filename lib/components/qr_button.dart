import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';

class QrCode extends StatefulWidget {
  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  Image beforeAnimation = Image.asset(
    'lib/icons/Scanner.png',
    color: Colors.white,
    height: 30,
  );
  Image afterAnimation = Image.asset(
    'lib/icons/close.png',
    color: Colors.white,
    height: 20,
  );

  bool a = true;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: kNavbarColor,
      child: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          setState(() {});
        },
        child: beforeAnimation,
        backgroundColor: kNavbarColor,
      ),
    );
  }
}
