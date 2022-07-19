import 'package:EzyShare/constants.dart';
import 'package:EzyShare/screens/card_design.dart';
import 'package:EzyShare/screens/saved_cards.dart';
import 'package:EzyShare/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/profile_containers.dart';

class Profile extends StatelessWidget {
  static const String id = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kNavbarColor,
        title: Text(
          'Profile',
          style: kNavbarText.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ProfileContainers(
              prefixIcon: 'Bookmark',
              contentTitle: 'Saved Cards',
              onTap: () {
                Navigator.pushNamed(context, SavedCard.id);
              },
            ),
            ProfileContainers(
              prefixIcon: 'Credit card',
              contentTitle: 'Change Cards',
              onTap: () {
                Navigator.pushNamed(context, CardDesign.id);
              },
            ),
            ProfileContainers(
              prefixIcon: 'Settings',
              contentTitle: 'Setting',
            ),
            ProfileContainers(
              prefixIcon: 'Info circle',
              contentTitle: 'About Us',
            ),
            ProfileContainers(
              prefixIcon: 'Info circle',
              contentTitle: 'FAQs',
            ),
            ProfileContainers(
              prefixIcon: 'Plus',
              contentTitle: 'Follow and Invite freinds',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignIn.id);
              },
              child: ProfileContainers(
                prefixIcon: 'Logout',
                contentTitle: 'Sign Out',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
