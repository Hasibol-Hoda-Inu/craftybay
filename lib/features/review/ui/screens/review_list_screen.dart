import 'package:flutter/material.dart';

import '../widgets/review_card_widget.dart';

class ReviewListScreen extends StatefulWidget {
  static const String name = "/review";
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: _getReviewCardWidget(),
        ),
      ),
    );
  }
}

List<Widget> _getReviewCardWidget(){
  List<Widget> reviewCardWidgetList = [];
  for(int i=0; i<6; i++){
    reviewCardWidgetList.add(const ReviewCardWidget());
  }
  return reviewCardWidgetList;
}

