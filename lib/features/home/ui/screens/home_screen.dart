import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/search_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController sbController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              SearchBoxWidget(controller: sbController,),
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0,
                  viewportFraction: 1,
                ),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          alignment: Alignment.center,
                          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navLogoSvg, height: 34,),
      actions: [
        IconButton.filledTonal(
            onPressed: (){},
            icon: const Icon(Icons.person_outline)),
        IconButton.filledTonal(
            onPressed: (){},
            icon: const Icon(Icons.call_outlined)),
        IconButton.filledTonal(
            onPressed: (){},
            icon: const Icon(Icons.notifications_none_rounded)),
      ],
    );
  }
}


