import 'package:craftybay/features/review/ui/screens/review_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../application/app_colors.dart';

class ReviewSectionWidget extends StatelessWidget {
  const ReviewSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        const Row(
          spacing: 4,
          children: [
            Icon(Icons.star_rounded, color: Colors.amber, size: 24,),
            Text("4.8", style: TextStyle(fontSize: 18),),
          ],
        ),
        TextButton(
            onPressed: (){
              Navigator.pushNamed(context, ReviewListScreen.name);
            },
            child: const Text("Reviews"),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.favorite_border, color: Colors.white, size: 14,),
        ),
      ],
    );
  }
}