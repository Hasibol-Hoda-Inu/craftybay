import 'package:craftybay/application/app_colors.dart';
import 'package:craftybay/application/assets_path.dart';
import 'package:craftybay/features/cart/ui/widgets/cart_item_card_widget.dart';
import 'package:craftybay/features/common/ui/widgets/product_quantity_stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/controllers/main_bottom_nav_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__)=>_onPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: _onPop,
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Cart"),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                height: 2,
                color: Colors.grey.shade200,)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index)=>const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CartItemCardWidget(),
                  )),
            ),
            buildCheckOutContainer(context)
          ],
        ),
      ),
    );
  }

  Widget buildCheckOutContainer(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total Price",),
              Text("\$100,000.00", style: TextStyle(
                  color: AppColors.themeColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
                onPressed: (){},
                child: const Text("Checkout", style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }

  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}


