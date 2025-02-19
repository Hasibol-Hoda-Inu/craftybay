import 'package:craftybay/features/common/data/models/category_list_model.dart';
import 'package:craftybay/features/common/data/models/category_model.dart';
import 'package:craftybay/features/common/data/models/category_pagination_model/category_pagination_model.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class CategoryListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _count = 5;
  int _page = 1;

  CategoryPaginationModel? _categoryPaginationModel;
  List<CategoryItemModel> get categoryList => _categoryPaginationModel?.data?.results ?? [];

  Future<bool> getCategoryList()async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParams = {
      "count": _count,
      "page": _page,
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.categoryList,
      queryParams: queryParams,
    );

    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
      _categoryPaginationModel = CategoryPaginationModel.fromJson(response.responseData);
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}