import 'package:craftybay/application/app_colors.dart';
import 'package:craftybay/features/cart/ui/widgets/cart_item_card_widget.dart';
import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:craftybay/features/home/ui/widgets/banner_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../controllers/cart_list_controller.dart';
import '../widgets/cart_screen_shimmer_loading.dart';

class CartScreen extends StatefulWidget {
  static const String name = "/cartScreen";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final AuthController _auth = Get.find<AuthController>();
  final CartListController _cartListController = Get.find<CartListController>();

  @override
  void initState() {
    super.initState();
    getCartItemList();
  }

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
        body: RefreshIndicator(
          onRefresh: ()async{
            getCartItemList();
          },
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<CartListController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CartScreenShimmerLoading();
                    }
                    return ListView.builder(
                        itemCount: controller.cartItemList.length,
                        itemBuilder: (BuildContext context, index)=> Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CartItemCardWidget(cartItem: controller.cartItemList[index],),
                        ));
                  }
                ),
              ),
              buildCheckOutContainer(context)
            ],
          ),
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


  Future<void> getCartItemList()async {
    String? token = _auth.accessToken;
    print("TOKEN: $token");
    _cartListController.cartItemList.clear();
    bool result = await _cartListController.getCartList(token ?? "");
    if(result && mounted){

    }else{
      if(mounted){
        showSnackBarMessage(context, _cartListController.errorMessage ?? "Something went wrong", false);
      }
    }
  }
}




