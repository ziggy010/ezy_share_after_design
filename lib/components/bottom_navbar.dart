import 'package:ezy_share_got_design/components/qr_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../screens/homepage.dart';
import '../screens/saved_cards.dart';

class BottomNavigationBarOne extends StatefulWidget {
  static const String id = 'BottomNavigationBarOne';

  @override
  State<BottomNavigationBarOne> createState() => _BottomNavigationBarOneState();
}

class _BottomNavigationBarOneState extends State<BottomNavigationBarOne> {
  final Screens = [
    Homepage(),
    SavedCard(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: QrCode(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: kBackgroundColor,
      body: Screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 97.h,
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
                child: Image.asset(
                  'lib/icons/Vector.png',
                  color: currentIndex == 0 ? kNavbarColor : Color(0xFFB2B2B3),
                ),
              ),
              label: 'My Cards',
              backgroundColor: kContainerColor,
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor:
                    currentIndex == 1 ? Color(0xFFF2F6FD) : Color(0xFFFEFEFF),
                child: Image.asset(
                  'lib/icons/Bookmark.png',
                  color: currentIndex == 1 ? kNavbarColor : Color(0xFFB2B2B3),
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
