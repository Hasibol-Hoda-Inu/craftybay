import 'package:craftybay/features/auth/controllers/timer_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

import '../services/network_caller/network_caller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkCaller());
    Get.put(MainBottomNavController());
    Get.put(TimerController());
    Get.put(EmailVerificationController());
  }

}