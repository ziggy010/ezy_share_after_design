import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrScanPage extends StatefulWidget {
  static const String id = 'QrScanPage';

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  @override
  Widget build(BuildContext context) {
    Color unSelectedText = Color(0xFF585664);
    bool containerSelected = true;

    Color selectedButtonColor = kContainerPrimaryColor;

    Color notSelectedButtonColor = Colors.transparent;

    Color notSelectedTextColor = Color(0xFF585664);

    bool pageSelected = true;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        title: Text(
          'QR Scan',
          style: kNavbarText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 700.h,
            child: Stack(
              children: [
                Container(
                  height: 700.h,
                  width: 370.h,
                  color: Colors.black,
                  child: ScanQrPage(),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    height: 48.h,
                    width: 312.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pageSelected = true;
                              // _controller.jumpToPage(0);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 48.h,
                              width: 147.w,
                              decoration: BoxDecoration(
                                color: pageSelected
                                    ? selectedButtonColor
                                    : notSelectedButtonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Free Designs',
                                  style: TextStyle(
                                    color: pageSelected
                                        ? Colors.white
                                        : notSelectedTextColor,
                                    fontSize: 14,
                                    fontFamily: 'manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pageSelected = false;
                              // _controller.jumpToPage(1);
                            });
                          },
                          child: Container(
                            height: 48.h,
                            width: 156.w,
                            decoration: BoxDecoration(
                              color: pageSelected
                                  ? notSelectedButtonColor
                                  : selectedButtonColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Premium Designs',
                                style: TextStyle(
                                  color: pageSelected
                                      ? notSelectedTextColor
                                      : Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
