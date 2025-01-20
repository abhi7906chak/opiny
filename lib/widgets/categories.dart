import 'package:flutter/material.dart';

import '../custom_text.dart';

class CategoryIcon extends StatelessWidget {
  final String imagePath; // Path to the image
  final String label;

   const CategoryIcon({required this.imagePath, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50, // Adjusted height for image
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(border: Border.all(),color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Replace Icon with Image
          Image.asset(
            imagePath,
            width: 40, // Set the image width
            height: 40, // Set the image height
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 4),
          CustomText(text:
            label,
            fontSize: 7,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
