import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/ui/widgets/product_list_shimmer_loading.dart';
import 'package:craftybay/features/wishlist/ui/controllers/wishlist_item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../widgets/wishlist_product_card_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistItemListController _wishlistItemController = Get.find<WishlistItemListController>();
  final AuthController _auth = Get.find<AuthController>();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _wishlistItemController.getWishlistItemList(_auth.accessToken ?? "");
    _scrollController = ScrollController()..addListener(_loadMoreData);
  }
  void _loadMoreData(){
    if(_scrollController.position.extentAfter < 300){
      _wishlistItemController.getWishlistItemList(_auth.accessToken ?? "");
    }
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
          title: const Text("Wishlist"),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                height: 2,
                color: Colors.grey.shade200,)),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            _wishlistItemController.refreshWishlistItemList();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0,),
            child: GetBuilder<WishlistItemListController>(
              builder: (controller) {
                if(controller.initialInProgress){
                  return const ProductListShimmerLoading();
                }
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, index)=>
                             FittedBox(
                                child: WishlistProductCardWidget(
                                    wishlistItem: _wishlistItemController.wishlistItemList[index]
                                )),
                        itemCount: _wishlistItemController.wishlistItemList.length,

                      ),
                    ),
                    Visibility(
                        visible: controller.inProgress,
                        child: const LinearProgressIndicator())
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}
