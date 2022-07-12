import 'package:ezy_share_got_design/components/bottom_navbar.dart';
import 'package:ezy_share_got_design/screens/card_design.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:ezy_share_got_design/screens/profile.dart';
import 'package:ezy_share_got_design/screens/qr_code.dart';
import 'package:ezy_share_got_design/screens/qr_scan_page.dart';
import 'package:ezy_share_got_design/screens/saved_cards.dart';
import 'package:ezy_share_got_design/screens/visiting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Homepage.id,
          routes: {
            Homepage.id: (context) => Homepage(),
            Profile.id: (context) => Profile(),
            CardDesign.id: (context) => CardDesign(),
            SavedCard.id: (context) => SavedCard(),
            VisitingCard.id: (context) => VisitingCard(),
            QrScanPage.id: (context) => QrScanPage(),
            ScanQrPage.id: (context) => ScanQrPage(),
            BottomNavigationBarOne.id: (context) => BottomNavigationBarOne(),
          },
        );
      }),
    );
  }
}
