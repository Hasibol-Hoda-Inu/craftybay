import 'package:craftybay/application/app_theme_data.dart';
import 'package:craftybay/application/controller_binders.dart';
import 'package:craftybay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:craftybay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:craftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:craftybay/features/category/ui/screens/category_list_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:craftybay/features/review/ui/screens/create_review.dart';
import 'package:craftybay/features/review/ui/screens/review_list_screen.dart';
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
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }else if(settings.name == EmailVerificationScreen.name){
          widget = const EmailVerificationScreen();
        }else if (settings.name == OtpVerificationScreen.name){
          String userEmail = settings.arguments as String;
          widget = OtpVerificationScreen(email: userEmail,);
        }else if(settings.name == CompleteProfileScreen.name){
          widget = const CompleteProfileScreen();
        }else if(settings.name == MainBottomNavScreen.name){
          widget = const MainBottomNavScreen();
        }else if(settings.name == CategoryListScreen.name){
          widget = const CategoryListScreen();
        }else if(settings.name == ProductListScreen.name){
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        }else if(settings.name == ProductDetailsScreen.name){
          int id = settings.arguments as int;
          widget = ProductDetailsScreen(productId: id);
        }else if(settings.name == ReviewListScreen.name){
          widget = const ReviewListScreen();
        }else if(settings.name == CreateReview.name){
          widget = const CreateReview();
        }

        return MaterialPageRoute(builder: (context){
          return widget;
        });
      },

    );
  }
}
