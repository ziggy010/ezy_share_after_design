import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrScanPage extends StatelessWidget {
  static const String id = 'QrScanPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        title: Text(
          'QR Scan',
          style: kNavbarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 48.h,
                  width: 312.w,
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 48.h,
                          width: 156.w,
                          decoration: BoxDecoration(
                            color: kNavbarColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Free Designs',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 48.h,
                          width: 156.w,
                          decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Premium Designs',
                              style: TextStyle(
                                color: Colors.black,
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
                SizedBox(
                  height: 20.h,
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    height: 500.h,
                    width: 312.w,
                    color: Colors.black,
                    child: ScanQrPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
