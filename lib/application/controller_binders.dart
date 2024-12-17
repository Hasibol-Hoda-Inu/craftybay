import 'package:craftybay/features/auth/controllers/timer_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(TimerController());
  }

}