import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class CreateOrderController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;
  

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> postCreateOrder(
      String token,
      String fullName,
      String address,
      String city,
      String postCode,
      String phone
      )async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> reqBody = {
    "payment_method": "cod",
    "shipping_address": {
      "full_name": fullName,
      "address": address,
      "city": city,
      "postal_code": postCode,
      "phone": phone
    }
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      Urls.createOrderUrl,
      body: reqBody,
      accessToken: token,
    );
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