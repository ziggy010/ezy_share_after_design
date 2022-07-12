import 'package:ezy_share_got_design/components/bottom_navbar.dart';
import 'package:ezy_share_got_design/components/free_design.dart';
import 'package:ezy_share_got_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homepage.dart';

class SavedCard extends StatefulWidget {
  static const String id = 'SavedCard';

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard> {
  int currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
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
        body: Padding(
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
        floatingActionButton: CircleAvatar(
          radius: 35,
          backgroundColor: kNavbarColor,
          child: Stack(
            children: [
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  setState(() {
                    // finalImage = a ? before : after;
                    // a = !a;
                    // isQrContentVisible = !isQrContentVisible;
                  });
                },
                child: Image.asset(
                  'lib/icons/Scanner.png',
                  color: Colors.white,
                  height: 20,
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
                  child: Image.asset(
                    'lib/icons/Vector.png',
                    color: Color(0xFFB2B2B3),
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
                        fontFamily: 'manrope',
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
