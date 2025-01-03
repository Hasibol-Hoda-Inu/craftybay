import 'package:craftybay/features/review/ui/screens/create_review.dart';
import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
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
        leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Reviews"),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              height: 2,
              color: Colors.grey.shade200,)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: _getReviewCardWidget(),
              ),
            ),
          ),
          buildAddReviewsContainer(context),
        ],
      ),
    );
  }

  void _onPop(){
    Navigator.pop(context);
  }

  Widget buildAddReviewsContainer(BuildContext context) {
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
              Text("Reviews (1000)", style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 18),),
            ],
          ),
          IconButton.filledTonal(
              onPressed: _onTapAddReviewScreen,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.themeColor,
                padding: const EdgeInsets.all(12)
              ),
              icon: const Icon(Icons.add, color: Colors.white,))
        ],
      ),
    );
  }

  void _onTapAddReviewScreen(){
    Navigator.pushNamed(context, CreateReview.name);
  }
}

List<Widget> _getReviewCardWidget(){
  List<Widget> reviewCardWidgetList = [];
  for(int i=0; i<6; i++){
    reviewCardWidgetList.add(const ReviewCardWidget());
  }
  return reviewCardWidgetList;
}

