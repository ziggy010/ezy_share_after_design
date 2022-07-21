import 'package:ezy_share_got_design/screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ezy_share_got_design/components/bottom_navbar.dart';
import 'package:ezy_share_got_design/provider/theme_provider.dart';
import 'package:ezy_share_got_design/screens/card_design.dart';
import 'package:ezy_share_got_design/screens/card_details.dart';
import 'package:ezy_share_got_design/scanner/document_scan.dart';
import 'package:ezy_share_got_design/screens/final_Qr_ScanPage.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:ezy_share_got_design/screens/onboarding_scree.dart';
import 'package:ezy_share_got_design/screens/profile.dart';
import 'package:ezy_share_got_design/scanner/qr_code.dart';
import 'package:ezy_share_got_design/scanner/qr_scan_page.dart';
import 'package:ezy_share_got_design/screens/authentication/register_screen.dart';
import 'package:ezy_share_got_design/screens/saved_cards.dart';
import 'package:ezy_share_got_design/screens/authentication/sign_in.dart';
import 'package:ezy_share_got_design/screens/visiting_card.dart';
import 'screens/final_Qr_ScanPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          initialRoute: SignIn.id,
          routes: {
            OnboardingScreen.id: (context) => OnboardingScreen(),
            Homepage.id: (context) => Homepage(),
            SignIn.id: (context) => SignIn(),
            RegisterScreen.id: (context) => RegisterScreen(),
            CardScreen.id: (context) => CardScreen(),
            Profile.id: (context) => Profile(),
            CardDesign.id: (context) => CardDesign(),
            SavedCard.id: (context) => SavedCard(),
            VisitingCard.id: (context) => VisitingCard(),
            QrScanPage.id: (context) => QrScanPage(),
            ScanQrPage.id: (context) => ScanQrPage(),
            BottomNavigationBarOne.id: (context) => BottomNavigationBarOne(),
            DocumentScan.id: (context) => const DocumentScan(),
            FinalQrPage.id: (context) => FinalQrPage(),
            ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
          },
        );
      }),
    );
  }
}
