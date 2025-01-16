import 'package:craftybay/features/common/data/models/category_list_model.dart';
import 'package:craftybay/features/common/data/models/category_model.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class CategoryListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  CategoryListModel? _categoryListModel;
  List<CategoryModel> get categoryList => _categoryListModel?.categoryList ?? [];

  Future<bool> getCategoryList()async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.categoryList);
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}