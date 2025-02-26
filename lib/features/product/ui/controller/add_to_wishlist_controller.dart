import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class AddToWishlistController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> postAddToWishlist(String token, String id)async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> reqBody = {
      "product": id,
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      Urls.wishlistUrl,
      accessToken: token,
      body: reqBody,
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