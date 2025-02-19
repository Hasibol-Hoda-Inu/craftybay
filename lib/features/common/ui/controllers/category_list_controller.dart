import 'package:craftybay/features/common/data/models/category_pagination_model/category_pagination_model.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class CategoryListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1 && inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final int _count = 30;
  int _page = 0;
  int? _lastPage;

  final List<CategoryItemModel> _categoryList = [];
  List<CategoryItemModel> get categoryList => _categoryList;

  Future<bool> getCategoryList()async{
    _page++;
    if(_lastPage != null && _page > _lastPage!)return false;

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
      CategoryPaginationModel paginationModel = CategoryPaginationModel.fromJson(response.responseData);
      _categoryList.addAll(paginationModel.data?.results ?? []);
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}