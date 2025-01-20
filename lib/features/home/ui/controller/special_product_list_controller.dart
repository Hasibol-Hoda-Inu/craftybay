import 'package:craftybay/features/common/data/models/product_list_model.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';
import '../../../common/data/models/product_model.dart';

class ProductListBySpecialController extends GetxController{
  
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProductListModel? _productListModel;
  List<ProductModel> get productList => _productListModel?.productList ?? [];
  
  Future<bool> getSpecialProductList()async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.productListByRemarksList("special"));
    if(response.isSuccess){
    isSuccess = true;
    _productListModel = ProductListModel.fromJson(response.responseData);
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