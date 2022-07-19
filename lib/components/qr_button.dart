import 'package:EzyShare/constants.dart';
import 'package:EzyShare/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrCode extends StatefulWidget {
  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String before = 'Scanner';
  String after = 'close';

  String finalImage = 'Scanner';

  bool imageFirst = true;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: kNavbarColor,
      child: Stack(
        children: [
          FloatingActionButton(
            elevation: 0,
            onPressed: () {
              setState(() {});
            },
            child: Image.asset(
              'lib/icons/$finalImage.png',
              color: Colors.white,
              height: 20,
            ),
            backgroundColor: kNavbarColor,
          ),
        ],
      ),
    );
  }
}
