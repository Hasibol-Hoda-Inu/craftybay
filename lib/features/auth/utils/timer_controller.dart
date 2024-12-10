import 'package:get/get.dart';
import 'dart:async';

class TimerController extends GetxController {
  int remainingTime = 0;
  bool isButtonActive = true;

  void startTimer() {
    if (!isButtonActive) return;
    isButtonActive = false;
    remainingTime = 120;
    update();

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        remainingTime--;
        update();
      } else {
        timer.cancel();
        isButtonActive = true;
        update();
      }
    });
  }
}
