import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  static const String id = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      appBar: AppBar(
        backgroundColor: Color(0xFF585CE5),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'manrope',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ProfileContainers(
              prefixIcon: Icons.bookmark_outline,
              contentTitle: 'Saved Cards',
            ),
            ProfileContainers(
              prefixIcon: Icons.wallet_outlined,
              contentTitle: 'Change Cards',
            ),
            ProfileContainers(
              prefixIcon: Icons.settings_outlined,
              contentTitle: 'Setting',
            ),
            ProfileContainers(
              prefixIcon: Icons.info_outline,
              contentTitle: 'About Us',
            ),
            ProfileContainers(
              prefixIcon: Icons.info_outline,
              contentTitle: 'FAQs',
            ),
            ProfileContainers(
              prefixIcon: Icons.add_circle_outline_outlined,
              contentTitle: 'Follow and Invite freinds',
            ),
            ProfileContainers(
              prefixIcon: Icons.logout_outlined,
              contentTitle: 'Sign Out',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileContainers extends StatelessWidget {
  final IconData prefixIcon;
  final String contentTitle;

  ProfileContainers({
    required this.prefixIcon,
    required this.contentTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        height: 50.h,
        width: 312.w,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    prefixIcon,
                    color: Color(0xFF585664),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    contentTitle,
                    style: TextStyle(
                      color: Color(0xFF585664),
                      fontFamily: 'manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: Color(0xFF585664),
              )
            ],
          ),
        ),
      ),
    );
  }
}
