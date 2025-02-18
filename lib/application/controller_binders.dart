import 'package:craftybay/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/timer_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/common/ui/controllers/product_list_by_category_controller.dart';
import 'package:craftybay/features/home/ui/controller/new_product_list_controller.dart';
import 'package:craftybay/features/home/ui/controller/popular_product_list_controller.dart';
import 'package:craftybay/features/home/ui/controller/special_product_list_controller.dart';
import 'package:craftybay/features/product/ui/controller/product_details_controller.dart';
import 'package:get/get.dart';

import '../features/auth/ui/controllers/sign_up_controller.dart';
import '../features/home/ui/controller/slider_list_controller.dart';
import '../services/network_caller/network_caller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkCaller());
    Get.put(MainBottomNavController());
    Get.put(TimerController());
    Get.put(SignInController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
    Get.put(SignUpController());
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(ProductListByNewController());
    Get.put(ProductListBySpecialController());
    Get.put(ProductListByPopularController());
    Get.put(ProductListByCategoryController());
    Get.put(ProductDetailsController());
  }

}