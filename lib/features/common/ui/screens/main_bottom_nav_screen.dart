import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/ui/screens/home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  static const String name = "MainBottomNavScreen";
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<MainBottomNavController>(
        builder: (controller) {
          return NavigationBar(
              selectedIndex: controller.selectedIndex,
              onDestinationSelected: controller.changeIndex,
              destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(icon: Icon(Icons.category_outlined), label: "Categories"),
            NavigationDestination(icon: Icon(Icons.add_shopping_cart), label: "Cart"),
            NavigationDestination(icon: Icon(Icons.favorite_border), label: "Wishlist"),
          ]);
        }
      ),

    );
  }
}