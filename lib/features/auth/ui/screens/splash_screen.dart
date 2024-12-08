import 'package:craftybay/application/assets_path.dart';
import 'package:craftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../application/app_colors.dart';

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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(AssetsPath.logoSvg, width: 120,),
              const Spacer(),
              const CircularProgressIndicator(color: AppColors.themeColor,),
              const SizedBox(height: 20,),
              const Text("Version: 1.0.0"),
            ],
          ),
        ),
      ),
    );
  }
}
