import 'package:craftybay/features/cart/ui/screens/cart_screen.dart';
import 'package:craftybay/features/home/ui/controller/home_banner_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../category/ui/screens/category_list_screen.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../../../wishlist/ui/screens/wishlist_screen.dart';
import '../controllers/main_bottom_nav_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  static const String name = "/MainBottomNavScreen";
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = const [
     HomeScreen(),
     CategoryListScreen(),
     CartScreen(),
     WishlistScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeBannerListController>().getBannerSliders();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
            body: _screens[controller.selectedIndex],
            bottomNavigationBar: NavigationBar(
                selectedIndex: controller.selectedIndex,
                onDestinationSelected: controller.changeIndex,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.home_outlined), label: "Home"),
                  NavigationDestination(
                      icon: Icon(Icons.category_outlined), label: "Categories"),
                  NavigationDestination(
                      icon: Icon(Icons.add_shopping_cart), label: "Cart"),
                  NavigationDestination(
                      icon: Icon(Icons.favorite_border), label: "Wishlist"),
                ]),
        );}
        );
      }
  }
