import 'package:flutter/material.dart';

import '../../../home/ui/widgets/product_card_widget.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = "/product/product-list-by-category";
  const ProductListScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios)),
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
  void _onPop(){
    Navigator.pop(context);
  }
}
