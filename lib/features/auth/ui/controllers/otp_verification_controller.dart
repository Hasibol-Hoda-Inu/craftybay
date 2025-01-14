import 'package:craftybay/features/auth/data/models/profile_model.dart';
import 'package:craftybay/features/auth/ui/controllers/create_profile_controller.dart';
import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../application/urls.dart';
import 'read_profile_controller.dart';

class OtpVerificationController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = false;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? _token;
  String? get token => _token;

  final Logger _logger = Logger();

  Future<bool> verifyOtp(String email, String otp) async {
  bool isSuccess = false;
  _inProgress = true;
  update();
  final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.verifyOtpUrl(email, otp));
  if(response.isSuccess){
    isSuccess = true;
    _errorMessage = null;
    String token = response.responseData["data"];

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('accessToken', token);

    _logger.i("Token saved successfully: $token");

    await Get.find<ReadProfileController>().readProfile(token);

    if(Get.find<ReadProfileController>().profileModel == null){
      ///TODO: complete profile
      _shouldNavigateCompleteProfile = true;
    }else{
      ///TODO: save token using shared preferences
      await Get.find<AuthController>().saveUserData(token, Get.find<ReadProfileController>().profileModel!);
      _shouldNavigateCompleteProfile = false;
    }
  }else{
    isSuccess = false;
    _errorMessage = response.errorMessage;
  }
  _inProgress = false;
  update();
  return isSuccess;
  }

}