import 'package:ezy_share_got_design/screens/card_design.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:ezy_share_got_design/screens/profile.dart';
import 'package:ezy_share_got_design/screens/saved_cards.dart';
import 'package:ezy_share_got_design/screens/visiting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          },
        );
      }),
    );
  }
}
