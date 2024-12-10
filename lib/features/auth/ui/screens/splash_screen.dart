import 'package:craftybay/application/assets_path.dart';
import 'package:craftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../application/app_colors.dart';
import '../widgets/app_icon_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToEmailVerificationScreen();
  }

  Future<void> _goToEmailVerificationScreen()async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, EmailVerificationScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(color: AppColors.themeColor,),
              SizedBox(height: 20,),
              Text("Version: 1.0.0"),
            ],
          ),
        ),
      ),
    );
  }
}


