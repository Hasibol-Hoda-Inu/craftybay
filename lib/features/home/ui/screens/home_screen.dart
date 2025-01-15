import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:craftybay/features/home/ui/controller/home_banner_list_controller.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../application/assets_path.dart';
import '../../../common/ui/widgets/category_icon_widget.dart';
import '../../../common/ui/widgets/shimmer_loading.dart';
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
  final HomeBannerListController _homeBLController = Get.find<HomeBannerListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBoxWidget(controller: sbController,),
              const SizedBox(height: 16,),
              GetBuilder<HomeBannerListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return const ShimmerLoading();
                  }
                  return HomeCarouselSliderWidget(bannerList: controller.bannerList,);
                }
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Category', onTap: (){
                Get.find<MainBottomNavController>().changeIndex(1);
              },),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: _getCategoryList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Popular', onTap:()=> _onTapProductListScreen(categoryName: 'Popular'),),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: _getProductCardList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Special', onTap:()=> _onTapProductListScreen(categoryName: 'Special'),),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: _getProductCardList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'New', onTap:(){ _onTapProductListScreen(categoryName: 'New');}),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: _getProductCardList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapProductListScreen({required String categoryName}){
    Navigator.pushNamed(context, ProductListScreen.name, arguments: categoryName);
  }
  List<Widget> _getCategoryList(){
    List<Widget> categoryList = [];
    for(int i=0; i<10; i++){
      categoryList.add(const CategoryIconWidget());
    }
    return categoryList;
  }

  List<Widget> _getProductCardList(){
    List<Widget> productCardList = [];
    for(int i=0; i<10; i++){
      productCardList.add(const ProductCardWidget());
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








