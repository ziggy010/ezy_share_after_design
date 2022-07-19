import 'package:EzyShare/components/premium_design.dart';
import 'package:EzyShare/constants.dart';
import 'package:EzyShare/screens/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalQrPage extends StatefulWidget {
  static const String id = 'finalQrPage';

  @override
  State<FinalQrPage> createState() => _FinalQrPageState();
}

class _FinalQrPageState extends State<FinalQrPage> {
  PageController pageController = PageController();

  Color selectedContainerText = Colors.white;

  Color unSelectedContainerText = const Color(0xFF585664);

  bool selectedContainer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        title: const Text(
          'QR Scan',
          style: kNavbarText,
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                if (value == 0) {
                  selectedContainer = true;
                } else {
                  selectedContainer = false;
                }
              });
            },
            children: [
              Container(
                child: ScanQrPage(),
              ),
              Container(
                color: kBackgroundColor,
                child: Center(
                  child: Container(
                    height: 384.h,
                    width: 312.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 225, 225, 235),
                            spreadRadius: 1,
                            blurRadius: 18,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Share your card',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44.w),
                          child: Text(
                            'Scan this QR code to add this card to your account',
                            style: TextStyle(
                              color: Color(0x60211F30),
                              fontFamily: 'poppins',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 29.h,
                        ),
                        Image.asset(
                          'lib/images/qr-code.png',
                          height: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   color: kBackgroundColor,
              //   child: Container(
              //     height: 384.h,
              //     width: 312.w,
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius: BorderRadius.circular(12.r),
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Share your card',
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 18.sp,
              //             fontFamily: 'poppins',
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 8.h,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 44.w),
              //           child: Text(
              //             'Scan this QR code to add this card to your account',
              //             style: TextStyle(
              //               color: Color(0x60211F30),
              //               fontFamily: 'poppins',
              //               fontSize: 12.sp,
              //               fontWeight: FontWeight.w500,
              //             ),
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 29.h,
              //         ),
              //         Image.asset(
              //           'lib/images/qr-code.png',
              //           height: 160,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: 48.h,
              width: 312.w,
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = true;
                          pageController.jumpToPage(0);
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 148.w,
                        decoration: BoxDecoration(
                          color: selectedContainer
                              ? kNavbarColor
                              : kContainerColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'QR Scan',
                            style: TextStyle(
                              color: selectedContainer
                                  ? selectedContainerText
                                  : unSelectedContainerText,
                              fontSize: 14.sp,
                              fontFamily: 'manrope',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = false;
                          pageController.jumpToPage(1);
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 148.w,
                        decoration: BoxDecoration(
                          color: selectedContainer
                              ? kContainerColor
                              : kNavbarColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Share',
                            style: TextStyle(
                              color: selectedContainer
                                  ? unSelectedContainerText
                                  : selectedContainerText,
                              fontSize: 14.sp,
                              fontFamily: 'manrope',
                            ),
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
    );
  }
}
