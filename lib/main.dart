import 'package:ezy_share_got_design/screens/document_scan.dart';

import 'components/bottom_navbar.dart';
import 'provider/theme_provider.dart';
import 'screens/card_design.dart';
import 'screens/card_details.dart';
import 'screens/darkmode.dart';
import 'screens/homepage.dart';
import 'screens/onboarding_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/final_Qr_ScanPage.dart';
import 'screens/profile.dart';
import 'screens/qr_code.dart';
import 'screens/qr_scan_page.dart';
import 'screens/register_screen.dart';
import 'screens/saved_cards.dart';
import 'screens/sign_in.dart';
import 'screens/visiting_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: ((context, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: OnboardingScreen.id,
          routes: {
            OnboardingScreen.id: (context) => OnboardingScreen(),
            Homepage.id: (context) => Homepage(),
            SignIn.id: (context) => SignIn(),
            RegisterScreen.id: (context) => RegisterScreen(),
            CardScreen.id: (context) => CardScreen(),
            DarkMode.id: (context) => DarkMode(),
            Profile.id: (context) => Profile(),
            CardDesign.id: (context) => CardDesign(),
            SavedCard.id: (context) => SavedCard(),
            VisitingCard.id: (context) => VisitingCard(),
            QrScanPage.id: (context) => QrScanPage(),
            ScanQrPage.id: (context) => ScanQrPage(),
            BottomNavigationBarOne.id: (context) => BottomNavigationBarOne(),
            DocumentScan.id: (context) => const DocumentScan(),
            FinalQrPage.id: (context) => FinalQrPage(),
          },
        );
      }),
    );
  }
}
