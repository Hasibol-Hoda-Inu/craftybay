import 'package:flutter/material.dart';

class ProductListByRemarksScreen extends StatefulWidget {
  static const String name = "/product/product-list-by-remarks";
  const ProductListByRemarksScreen({
    super.key,
  });

  @override
  State<ProductListByRemarksScreen> createState() => _ProductListByRemarksScreenState();
}

class _ProductListByRemarksScreenState extends State<ProductListByRemarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remarks"),
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
        // child: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     mainAxisSpacing: 18,
        //   ),
        //   itemBuilder: (BuildContext context, index)=>const FittedBox(child: ProductCardWidget(productList: [],)),
        //   itemCount: 10,
        //
        // ),
      ),
    );
  }
  void _onPop(){
    Navigator.pop(context);
  }
}
