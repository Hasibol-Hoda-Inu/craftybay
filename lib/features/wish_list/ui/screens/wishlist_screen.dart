import 'package:craftybay/features/home/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/widgets/category_icon_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              height: 2,
              color: Colors.grey.shade200,)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 8,
            top: 8,
            right: 8,
            bottom: 0,
            ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (BuildContext context, index)=>const FittedBox(child: ProductCardWidget()),
          itemCount: 10,

        ),
      ),
    );
  }
}
