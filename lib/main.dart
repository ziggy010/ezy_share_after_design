import 'package:EzyShare/components/bottom_navbar.dart';
import 'package:EzyShare/provider/theme_provider.dart';
import 'package:EzyShare/screens/card_design.dart';
import 'package:EzyShare/screens/card_details.dart';
import 'package:EzyShare/screens/darkmode.dart';
import 'package:EzyShare/screens/document_scan.dart';
import 'package:EzyShare/screens/homepage.dart';
import 'package:EzyShare/screens/onboarding_scree.dart';
import 'package:EzyShare/screens/profile.dart';
import 'package:EzyShare/screens/qr_code.dart';
import 'package:EzyShare/screens/qr_scan_page.dart';
import 'package:EzyShare/screens/register_screen.dart';
import 'package:EzyShare/screens/saved_cards.dart';
import 'package:EzyShare/screens/sign_in.dart';
import 'package:EzyShare/screens/visiting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/final_Qr_ScanPage.dart';

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
