import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/assets_path.dart';
import '../../../common/ui/widgets/product_quantity_stepper_widget.dart';

class CartItemCardWidget extends StatefulWidget {
  const CartItemCardWidget({
    super.key,
  });

  @override
  State<CartItemCardWidget> createState() => _CartItemCardWidgetState();
}

class _CartItemCardWidgetState extends State<CartItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white.withValues(alpha: 0.7),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 8,
          children: [
            GestureDetector(
                onTap: _onTapNavigateToProductDetailsScreen,
                child: Image.asset(AssetsPath.productImagePng, width: 120,)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("New Year Special Shoe adfdfdsf d adfadsfsdfasd",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,),
                            const Text("Color: Red, Size: XL"),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.delete_rounded))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("\$100", style: TextStyle(
                          color: AppColors.themeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      ProductQuantityStepperWidget(onChange: (int value){})
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapNavigateToProductDetailsScreen(){
    Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
  }
}