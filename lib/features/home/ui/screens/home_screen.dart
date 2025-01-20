import 'package:craftybay/features/common/data/models/category_model.dart';
import 'package:craftybay/features/common/data/models/product_model.dart';
import 'package:craftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/home/ui/controller/home_banner_list_controller.dart';
import 'package:craftybay/features/home/ui/controller/new_product_list_controller.dart';
import 'package:craftybay/features/home/ui/controller/special_product_list_controller.dart';
import 'package:craftybay/features/home/ui/widgets/category_list_shimmer_loading.dart';
import 'package:craftybay/features/home/ui/widgets/product_list_shimmer_loading.dart';
import 'package:craftybay/features/product/ui/screens/product_list_by_remarks_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../application/assets_path.dart';
import '../../../common/ui/widgets/category_icon_widget.dart';
import '../controller/popular_product_list_controller.dart';
import '../widgets/banner_shimmer_loading.dart';
import '../widgets/home_carousel_slider_widget.dart';
import '../widgets/home_section_title.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/search_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController sbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: ()async{
          Get.find<HomeBannerListController>().getBannerSliders();
          Get.find<CategoryListController>().getCategoryList();
          Get.find<ProductListByPopularController>().getPopularProductList();
          Get.find<ProductListBySpecialController>().getSpecialProductList();
          Get.find<ProductListByNewController>().getNewProductList();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SearchBoxWidget(controller: sbController,),
                const SizedBox(height: 16,),
                GetBuilder<HomeBannerListController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const BannerShimmerLoading();
                    }
                    return HomeCarouselSliderWidget(bannerList: controller.bannerList,);
                  }
                ),
                const SizedBox(height: 16,),
                HomeSectionHeader(title: 'Category', onTap: (){
                  Get.find<MainBottomNavController>().changeIndex(1);
                },),
                const SizedBox(height: 8,),
                GetBuilder<CategoryListController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CategoryListShimmerLoading();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 12,
                        children: _getCategoryList(controller.categoryList),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 16,),
                HomeSectionHeader(title: 'Popular', onTap:()=>_onTapProductListScreen(categoryName: 'Popular')),
                const SizedBox(height: 8,),
                GetBuilder<ProductListByPopularController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const ProductListShimmerLoading();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 12,
                        children: _getProductCardList(controller.productList),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 16,),
                HomeSectionHeader(title: 'Special', onTap:()=> _onTapProductListScreen(categoryName: 'Special'),),
                const SizedBox(height: 8,),
                GetBuilder<ProductListBySpecialController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const ProductListShimmerLoading();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 12,
                        children: _getProductCardList(controller.productList),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 16,),
                HomeSectionHeader(title: 'New', onTap:(){ _onTapProductListScreen(categoryName: 'New');}),
                const SizedBox(height: 8,),
                GetBuilder<ProductListByNewController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const ProductListShimmerLoading();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 12,
                        children: _getProductCardList(controller.productList),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapProductListScreen({required String categoryName}){
    Navigator.pushNamed(context, ProductListScreen.name, arguments: categoryName);
  }

  List<Widget> _getCategoryList(List<CategoryModel> categoryModel){
    List<Widget> categoryList = [];
    for(int i=0; i<categoryModel.length; i++){
      categoryList.add(CategoryIconWidget(categoryModel: categoryModel[i],));
    }
    return categoryList;
  }

  List<Widget> _getProductCardList(List<ProductModel> productList){
    List<Widget> productCardList = [];
    for(int i=0; i<productList.length; i++){
      productCardList.add(ProductCardWidget(productModel: productList[i],));
    }
    return productCardList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navLogoSvg, height: 34,),
      actions: [
        IconButton.filledTonal(
            onPressed: (){},
            icon: const Icon(Icons.person_outline)),
        IconButton.filledTonal(
            onPressed: (){},
            icon: const Icon(Icons.call_outlined)),
        IconButton.filledTonal(
            onPressed: (){},
            icon: const Icon(Icons.notifications_none_rounded)),
      ],
    );
  }
}








