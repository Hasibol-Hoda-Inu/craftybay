import 'package:craftybay/application/app_colors.dart';
import 'package:craftybay/features/product/widgets/product_image_carousel_slider_widget.dart';
import 'package:craftybay/features/product/widgets/product_quantity_stepper_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/review_section_widget.dart';
class ProductDetailsScreen extends StatefulWidget {
  static const String name = "/product/product-details";
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });
  final int productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> _sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios)),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              height: 2,
              color: Colors.grey.shade200,)),
      ),
      body: Column(
        children: [
          const ProductImageCarouselSliderWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            Text("Happy New Year Special Deal 30% off",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: AppColors.themeColor
                                )),
                            ReviewSectionWidget()
                          ],
                        ),
                      ),
                      ProductQuantityStepperWidget(onChange: (int value) {},)
                    ],
                  ),
                  Text("Color", style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 18),),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount: _sizes.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index)=>
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                child: Text(_sizes[index]),),
                            )),
                  ),
                  CircleAvatar(),
                ],
              ),
            ),
          ),
          buildAddToCartContainer(context)
        ],
      ),
    );
  }

  Widget buildAddToCartContainer(BuildContext context) {
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
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Price", style: TextTheme.of(context).titleMedium,),
                  Text("\$100", style: TextStyle(
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
                    child: const Text("Add to Cart", style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        );
  }

  void _onPop(){
    Navigator.pop(context);
  }
}


