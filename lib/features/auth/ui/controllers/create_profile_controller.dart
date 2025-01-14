import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class CreateProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;

  String? _errorMessage;
  String? get errorMessage =>_errorMessage;

  Future<bool> createProfile(
      String customerName,
      dynamic customerAddress,
      String customerCity,
      String customerState,
      String customerPostCode,
      String customerCountry,
      dynamic customerPhone,
      dynamic customerFax,
      String shippingName,
      dynamic shippingAddress,
      String shippingCity,
      String shippingState,
      String shippingPostCode,
      String shippingCountry,
      dynamic shippingNumber,
      ) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> body = {
      "cus_name" : customerName,
      "cus_add" : customerAddress,
      "cus_city" : customerCity,
      "cus_state" : customerState,
      "cus_postcode" : customerPostCode,
      "cus_country" : customerCountry,
      "cus_phone" : customerPhone,
      "cus_fax" : customerFax,
      "ship_name" : shippingName,
      "ship_add" : shippingAddress,
      "ship_city" : shippingCity,
      "ship_state" : shippingState,
      "ship_postcode" : shippingPostCode,
      "ship_country" : shippingCountry,
      "ship_phone" : shippingNumber,
    };

    String? token = await Get.find<AuthController>().getToken();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
        Urls.createProfile,
        accessToken: token,
        body: body);

    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
      // await Get.find<AuthController>().saveUserData(token, Get.find<ReadProfileController>().profileModel!);
      ///TODO: save user data in shared preference
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  // Future<String?> getToken() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString('accessToken');
  // }

}