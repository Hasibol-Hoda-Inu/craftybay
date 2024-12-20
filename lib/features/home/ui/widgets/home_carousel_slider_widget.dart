import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/application/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSliderWidget extends StatefulWidget {
  const HomeCarouselSliderWidget({
    super.key,
  });

  @override
  State<HomeCarouselSliderWidget> createState() => _HomeCarouselSliderWidgetState();
}

class _HomeCarouselSliderWidgetState extends State<HomeCarouselSliderWidget> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
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
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
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
        )
      ],
    );
  }
}
