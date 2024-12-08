import 'package:craftybay/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../application/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
