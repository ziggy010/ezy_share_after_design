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
      bottomNavigationBar: SizedBox(
        height: 107.h,
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFFEFEFF),
          selectedItemColor: kNavbarColor,
          currentIndex: currentIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(
            fontFamily: 'manrope',
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor:
                    currentIndex == 0 ? Color(0xFFF2F6FD) : Color(0xFFFEFEFF),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                    Navigator.pushNamed(context, Homepage.id);
                  },
                  child: Image.asset(
                    'lib/icons/Vector.png',
                    color: currentIndex == 0 ? kNavbarColor : Color(0xFFB2B2B3),
                  ),
                ),
              ),
              label: 'My Cards',
              backgroundColor: kContainerColor,
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor:
                    currentIndex == 1 ? Color(0xFFF2F6FD) : Color(0xFFFEFEFF),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                    Navigator.pushNamed(context, SavedCard.id);
                  },
                  child: Image.asset(
                    'lib/icons/Bookmark.png',
                    color: currentIndex == 1 ? kNavbarColor : Color(0xFFB2B2B3),
                  ),
                ),
              ),
              label: 'Saved Cards',
              backgroundColor: kContainerColor,
            ),
          ],
        ),
      ),
    );
  }
}
