import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerShimmerLoading extends StatefulWidget {
  const BannerShimmerLoading({super.key});

  @override
  State<BannerShimmerLoading> createState() => _BannerShimmerLoadingState();
}

class _BannerShimmerLoadingState extends State<BannerShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.maxFinite,
        height: 180,
        color: Colors.white,
      )
    );
  }
}
