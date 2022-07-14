import 'package:ezy_share_got_design/components/premium_design.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/qr_code.dart';
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

  Color unSelectedContainerText = Color(0xFF585664);

  bool selectedContainer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        title: Text(
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
                child: Center(child: PremiumDesign()),
              ),
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
