import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),),
        TextButton(
            onPressed: onTap,
            child: const Text("View all"))
      ],
    );
  }
}