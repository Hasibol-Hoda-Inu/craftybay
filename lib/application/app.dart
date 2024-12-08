import 'package:craftybay/application/app_theme_data.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      routes: {
        "/" : (context)=> const SplashScreen(),
      },
    );
  }
}
