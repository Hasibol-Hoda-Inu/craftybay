import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../application/app_colors.dart';

class CategoryIconWidget extends StatelessWidget {
  const CategoryIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: "Laptop");
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6)
            ),
            child: const Icon(Icons.laptop, color: AppColors.themeColor, size: 42,),
          ),
          const Text("Name", style: TextStyle(
              color: AppColors.themeColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}
