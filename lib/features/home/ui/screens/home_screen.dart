import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../application/assets_path.dart';
import '../../../common/ui/widgets/category_icon_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBoxWidget(controller: sbController,),
              const SizedBox(height: 16,),
              const HomeCarouselSliderWidget(),
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
              HomeSectionHeader(title: 'Popular', onTap: (){

              },),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: _getProductCardList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Special', onTap: (){},),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: _getProductCardList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'New', onTap: (){},),
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








