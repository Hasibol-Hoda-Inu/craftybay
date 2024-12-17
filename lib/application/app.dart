import 'package:craftybay/application/app_theme_data.dart';
import 'package:craftybay/application/controller_binders.dart';
import 'package:craftybay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:craftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:craftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/auth/ui/screens/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      initialRoute: "/",
      routes: {
        "/" : (context)=> const SplashScreen(),
        EmailVerificationScreen.name : (context)=> const EmailVerificationScreen(),
        OtpVerificationScreen.name : (context)=> const OtpVerificationScreen(),
        CompleteProfileScreen.name : (context)=> const CompleteProfileScreen(),
        MainBottomNavScreen.name : (context)=> const MainBottomNavScreen(),
      },
    );
  }
}
