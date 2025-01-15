import 'package:craftybay/features/home/data/models/banner_list_model.dart';
import 'package:craftybay/features/home/data/models/banner_model.dart';
import 'package:craftybay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../../application/urls.dart';

class HomeBannerListController extends GetxController{
  
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  BannerListModel? _bannerListModel;
  List<BannerModel> get bannerList => _bannerListModel?.bannerList ?? [];
  
  Future<bool> getBannerSliders()async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.homeBannerSliders);
    if(response.isSuccess){
    isSuccess = true;
    _bannerListModel = BannerListModel.fromJson(response.responseData);
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