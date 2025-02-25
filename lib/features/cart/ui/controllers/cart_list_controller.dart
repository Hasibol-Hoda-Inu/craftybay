import 'package:craftybay/features/cart/data/models/cart_item_list_data_model.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class CartListController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<Results> _cartItemList = [];
  List<Results> get cartItemList => _cartItemList;

  Future<bool> getCartList(String token)async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.cartListUrl,
      accessToken: token,
    );
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;

      CartItemListDataModel cartItemListDataModel = CartItemListDataModel.fromJson(response.responseData);
      _cartItemList.addAll(cartItemListDataModel.data?.results ?? []);

    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}