import 'package:craftybay/features/common/data/models/category_model.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class CategoryIconWidget extends StatelessWidget {
  const CategoryIconWidget({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

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
            child: Image.network(categoryModel.categoryImg ?? "",width: 40, height: 40, fit: BoxFit.scaleDown,),
          ),
          Text(categoryModel.categoryName ?? "", style: const TextStyle(
              color: AppColors.themeColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}
