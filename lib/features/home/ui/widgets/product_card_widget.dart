import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 130,
        child: Card(
          elevation: 5,
          shadowColor: Colors.black.withValues(alpha: 0.3),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withValues(alpha: 0.2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    )
                ),
                child: Image.asset("assets/images/shoe2.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Column(
                  children: [
                    const Text("New year special shoe 23",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      spacing: 6,
                      children: [
                        const Text("\$100", style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w700,
                        ),),
                        const Row(
                          children: [
                            Icon(Icons.star_rounded, color: Colors.amber, size: 18,),
                            Text("4.8",),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.favorite_border, color: Colors.white, size: 14,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}