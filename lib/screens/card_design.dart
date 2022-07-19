import 'package:ezy_share_got_design/components/free_design.dart';
import 'package:ezy_share_got_design/components/premium_design.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDesign extends StatefulWidget {
  static const String id = 'CardDesign';

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  Color selectedButtonColor = kContainerPrimaryColor;

  Color notSelectedButtonColor = Colors.transparent;

  Color notSelectedTextColor = Color(0xFF585664);

  bool pageSelected = true;

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        title: Text(
          'Card Designs',
          style: kNavbarText.copyWith(
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
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
                    onTap: () {
                      setState(() {
                        pageSelected = true;
                        _controller.jumpToPage(0);
                      });
                    },
                    child: Container(
                      height: 48.h,
                      width: 156.w,
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
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
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
                          'Premium Designs',
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
            SizedBox(
              height: 36.h,
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
                                FreeDesign(),
                                FreeDesign(),
                                FreeDesign(),
                                FreeDesign(),
                                FreeDesign(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                PremiumDesign(),
                                PremiumDesign(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
