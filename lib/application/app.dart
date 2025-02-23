import 'package:craftybay/application/app_theme_data.dart';
import 'package:craftybay/application/controller_binders.dart';
import 'package:craftybay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:craftybay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:craftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:craftybay/features/category/ui/screens/category_list_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_list_by_remarks_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_list_by_category_screen.dart';
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
        }else if(settings.name == SignInScreen.name){
          widget = const SignInScreen();
        }else if (settings.name == OtpVerificationScreen.name){
          Map<String, dynamic> loginInfo = settings.arguments as Map<String, dynamic>;
          widget = OtpVerificationScreen(email: loginInfo["email"], password: loginInfo["password"],);
        }else if(settings.name == SignUpScreen.name){
          widget = const SignUpScreen();
        }else if(settings.name == MainBottomNavScreen.name){
          widget = const MainBottomNavScreen();
        }else if(settings.name == CategoryListScreen.name){
          widget = const CategoryListScreen();
        }else if(settings.name == ProductListByCategoryScreen.name){
          Map<String, dynamic> name = settings.arguments as Map<String, dynamic>;
          widget = ProductListByCategoryScreen(categoryName: name['categoryName'], categoryId: name["categoryId"],);
        }else if(settings.name == ProductListByRemarksScreen.name){
          Map<String, dynamic> productListByRemarks = settings.arguments as Map<String, dynamic>;
          widget = ProductListByRemarksScreen(
            productList: productListByRemarks["productListByRemark"],
            remark: productListByRemarks["remark"],
          );
        }else if(settings.name == ProductDetailsScreen.name){
          Map<String, dynamic> productList = settings.arguments as Map<String, dynamic>;
          widget = ProductDetailsScreen(productList: productList["productList"]);
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
