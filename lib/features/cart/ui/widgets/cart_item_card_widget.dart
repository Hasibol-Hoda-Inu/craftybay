import 'package:craftybay/features/cart/data/models/cart_item_list_data_model.dart';
import 'package:craftybay/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/assets_path.dart';
import '../../../common/ui/widgets/product_quantity_stepper_widget.dart';

class CartItemCardWidget extends StatefulWidget {
  const CartItemCardWidget({
    super.key,
    required this.cartItem,
  });
  final Results cartItem;

  @override
  State<CartItemCardWidget> createState() => _CartItemCardWidgetState();
}

class _CartItemCardWidgetState extends State<CartItemCardWidget> {
  final CartListController _controller = Get.find<CartListController>();
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
                child: Image.network(
                  (widget.cartItem.product?.photos?.isNotEmpty == true)
                      ? "${widget.cartItem.product?.photos}"
                      : "https://hudaenu.xyz/wp-content/uploads/2025/02/shoe2.png",
                  width: 120,),
            ),
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
                            Text(widget.cartItem.product?.title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,),
                             Text("Color: ${widget.cartItem.product?.colors}, Size: ${widget.cartItem.product?.sizes}"),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.delete_rounded, color: Colors.grey,))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$${widget.cartItem.product?.currentPrice}", style: const TextStyle(
                          color: AppColors.themeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      ProductQuantityStepperWidget(
                        onChange: (int value){
                        _controller.calculateTotalPrice();
                      },
                      )
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