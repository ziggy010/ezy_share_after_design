import 'package:ezy_share_got_design/components/free_design.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/qr_content.dart';
import 'homepage.dart';

class SavedCard extends StatefulWidget {
  static const String id = 'SavedCard';

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int currentIndex = 0;
  bool isQrContentVisible = false;
  double currentOpacity = 0.0;
  updateOpacity() {
    setState(() {
      if (currentOpacity == 0.0) {
        currentOpacity = 1;
      } else {
        currentOpacity = 0.0;
      }
    });
  }

  double _containerHeight = 0;

  updateContainerHeight() {
    setState(() {
      if (_containerHeight == 0) {
        _containerHeight = 208.h;
      } else {
        _containerHeight = 0;
      }
    });
  }

  String before = 'Scanner';
  String after = 'close';

  String finalImage = 'Scanner';

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kNavbarColor,
          title: Text(
            'Saved Cards',
            style: kNavbarText,
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                top: 24.h,
                right: 24.w,
              ),
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Search Cards',
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: kNavbarColor,
                        size: 30.sm,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: kContainerColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: kNavbarColor,
                          width: 1.5,
                        ),
                      ),
                      filled: true,
                      fillColor: kContainerColor,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FreeDesign(),
                          FreeDesign(),
                          FreeDesign(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 87.w,
              bottom: 50.h,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 700),
                opacity: currentOpacity,
                curve: Curves.fastOutSlowIn,
                child: Container(
                  height: _containerHeight,
                  width: 187.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(children: [
                    QrContent(
                      text: 'Citizenship',
                    ),
                    QrContent(
                      text: 'Passport',
                    ),
                    QrContent(
                      text: 'QR Scan',
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: CircleAvatar(
          radius: 35.r,
          backgroundColor: kNavbarColor,
          child: Stack(
            children: [
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  setState(() {
                    isQrContentVisible = !isQrContentVisible;
                    finalImage = isQrContentVisible ? after : before;
                    updateOpacity();
                    updateContainerHeight();
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  });
                },
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Image.asset(
                    'lib/icons/$finalImage.png',
                    color: Colors.white,
                    height: 20,
                  ),
                ),
                backgroundColor: kNavbarColor,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 107.h,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 86.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Homepage.id);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'lib/icons/Vector.png',
                          color: Color(0xFFB2B2B3),
                        ),
                      ),
                      Text(
                        'My Cards',
                        style: TextStyle(
                          color: Color(0xFFB2B2B3),
                          fontSize: 10.sp,
                          fontFamily: 'poppins',
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFF2F6FD),
                      child: Image.asset(
                        'lib/icons/Bookmark.png',
                        color: kNavbarColor,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'My Cards',
                      style: TextStyle(
                        color: kNavbarColor,
                        fontSize: 10.sp,
                        fontFamily: 'poppins',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
