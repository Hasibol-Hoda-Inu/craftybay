import 'package:craftybay/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/timer_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

import '../features/auth/ui/controllers/create_profile_controller.dart';
import '../features/home/ui/controller/home_banner_list_controller.dart';
import '../services/network_caller/network_caller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkCaller());
    Get.put(MainBottomNavController());
    Get.put(TimerController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
    Get.put(CreateProfileController());
    Get.put(HomeBannerListController());
    Get.put(CategoryListController());
  }

}