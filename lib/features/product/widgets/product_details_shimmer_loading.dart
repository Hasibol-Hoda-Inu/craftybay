import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmerLoading extends StatefulWidget {
  const ProductDetailsShimmerLoading({super.key});

  @override
  State<ProductDetailsShimmerLoading> createState() => _ProductDetailsShimmerLoadingState();
}

class _ProductDetailsShimmerLoadingState extends State<ProductDetailsShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 120,
            color: Colors.white,
          ),
          Container(
            width: 250,
            height: 30,
            color: Colors.white,
          ),
          Container(
            width: 120,
            height: 30,
            color: Colors.white,
          ),
          Container(
            width: 40,
            height: 30,
            color: Colors.white,
          ),
          Container(
            width: double.maxFinite,
            height: 60,
            color: Colors.white,
          ),
          Container(
            width: double.maxFinite,
            height: 60,
            color: Colors.white,
          ),
          Container(
            width: double.maxFinite,
            height: 150,
            color: Colors.white,
          ),
          Container(
            width: double.maxFinite,
            height: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
