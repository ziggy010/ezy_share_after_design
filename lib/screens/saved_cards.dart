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

  final Screens = [
    Homepage(),
    SavedCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
