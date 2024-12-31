import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/application/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSliderWidget extends StatefulWidget {
  const ProductImageCarouselSliderWidget({
    super.key,
  });

  @override
  State<ProductImageCarouselSliderWidget> createState() => _ProductImageCarouselSliderWidgetState();
}

class _ProductImageCarouselSliderWidgetState extends State<ProductImageCarouselSliderWidget> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 260.0,
              viewportFraction: 1,
              onPageChanged: (currentIndex, reason){
                _valueNotifier.value = currentIndex;
              }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: AppColors.themeColor,
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, value, widget) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    for(int i = 0; i< 5; i++)
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: value==i? AppColors.themeColor : Colors.grey.shade300,
                      )
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}
