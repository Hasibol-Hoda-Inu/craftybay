import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class OtpVerificationController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
  bool isSuccess = false;
  _inProgress = true;
  update();
  final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.verifyOtpUrl(email, otp));
  if(response.isSuccess){
    isSuccess = true;
    _errorMessage = null;
  }else{
    isSuccess = false;
    _errorMessage = response.errorMessage;
  }
  _inProgress = false;
  update();
  return isSuccess;
  }

}