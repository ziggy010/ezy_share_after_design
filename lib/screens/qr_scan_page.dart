import 'package:EzyShare/components/free_design.dart';
import 'package:EzyShare/constants.dart';
import 'package:EzyShare/screens/qr_code.dart';
import 'package:EzyShare/screens/share_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/premium_design.dart';

class QrScanPage extends StatefulWidget {
  static const String id = 'QrScanPage';

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  @override
  Widget build(BuildContext context) {
    Color unSelectedText = const Color(0xFF585664);
    bool containerSelected = true;

    Color selectedButtonColor = kContainerPrimaryColor;

    Color notSelectedButtonColor = Colors.transparent;

    Color notSelectedTextColor = const Color(0xFF585664);
    PageController _controller = PageController();

    bool pageSelected = true;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kNavbarColor,
        title: const Text(
          'QR Scan',
          style: kNavbarText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: 48.h,
              width: 312.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageSelected = false;
                        _controller.jumpToPage(0);
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
                            'QR Scan',
                            style: TextStyle(
                              color: pageSelected
                                  ? Colors.white
                                  : notSelectedTextColor,
                              fontSize: 14,
                              fontFamily: 'poppins',
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
                        _controller.jumpToPage(1);
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
                          'Share QR',
                          style: TextStyle(
                            color: pageSelected
                                ? notSelectedTextColor
                                : Colors.white,
                            fontSize: 14,
                            fontFamily: 'poppins',
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
          Flexible(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      if (value == 0) {
                        pageSelected = true;
                      } else {
                        pageSelected = false;
                      }
                    });
                  },
                  children: [
                    Flexible(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ShareQR(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 600.h,
                        width: 450.h,
                        color: Colors.black,
                        child: ScanQrPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
