import 'package:ezy_share_got_design/constants.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:ezy_share_got_design/screens/saved_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavbar extends StatefulWidget {
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Color selectedIconColor = kNavbarColor;

  Color nonSelectedIconColor = Color(0xFFB2B2B3);

  Color selectedBackground = Color(0xFFF2F6FD);
  Color nonSelectedBackground = kContainerColor;

  bool selectedIcon = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      width: 360.w,
      decoration: BoxDecoration(
        color: kContainerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 76),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIcon = true;
                });
                Navigator.pushNamed(context, Homepage.id);
              },
              child: CircleAvatar(
                backgroundColor:
                    selectedIcon ? selectedBackground : nonSelectedBackground,
                child: Image.asset(
                  'lib/icons/Vector.png',
                  color: selectedIcon ? kNavbarColor : nonSelectedIconColor,
                ),
                // ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIcon = false;
                });
                Navigator.pushNamed(context, SavedCard.id);
              },
              child: CircleAvatar(
                backgroundColor:
                    selectedIcon ? nonSelectedBackground : selectedBackground,
                child: Image.asset(
                  'lib/icons/Bookmark.png',
                  color: selectedIcon ? nonSelectedIconColor : kNavbarColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
