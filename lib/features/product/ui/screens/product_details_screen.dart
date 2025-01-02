import 'package:craftybay/application/app_colors.dart';
import 'package:craftybay/features/product/widgets/product_image_carousel_slider_widget.dart';
import 'package:craftybay/features/product/widgets/product_quantity_stepper_widget.dart';
import 'package:craftybay/features/product/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/color_picker_widget.dart';
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
  final List<Color> _colors = [
    Colors.black87,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.green,
    Colors.orange
  ];
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
              padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                  bottom: 0,),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                    Text("Color", style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 20),),
                    const SizedBox(height: 8,),
                    ColorPickerWidget(colors: _colors,),
                    const SizedBox(height: 16,),
                    Text("Size", style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 20),),
                    const SizedBox(height: 8,),
                    SizePickerWidget(sizes: _sizes),
                    const SizedBox(height: 16,),
                    buildProductDescriptionMethod(context)
                  ],
                ),
              ),
            ),
          ),
          buildAddToCartContainer(context)
        ],
      ),
    );
  }

  Column buildProductDescriptionMethod(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 20),),
        const SizedBox(height: 8,),
        Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters",
          style: TextTheme.of(context).bodyLarge,
        )
      ],
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


