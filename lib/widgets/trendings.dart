import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';

class TrendingChip extends StatelessWidget {
  final String label;
  final String imagePath;

  const TrendingChip({
    super.key,
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
          Expanded(
            child: CustomText(
              text: label,
              fontSize: 12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
