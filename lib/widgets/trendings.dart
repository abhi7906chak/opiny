import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';

class TrendingChip extends StatelessWidget {
  final String label;
  final String imagePath;

<<<<<<< HEAD
  const TrendingChip({
    super.key,
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // Use LayoutBuilder to get available width
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Important: Use min to wrap content
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Image.asset(
                  imagePath,
                  width: 40, // Slightly reduced image size
                  height: 40,
                ),
              ),
              const SizedBox(
                  width: 4), // Add some spacing between image and text
              ConstrainedBox(
                // Constrain the text width
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth -
                      50, // Subtract image width + padding + spacing
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CustomText(
                    text: label,
                    fontSize: 12,
                    maxLines: 2, // Allow text to wrap to 2 lines
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis if it overflows
                  ),
                ),
              ),
            ],
          ),
        );
      },
=======

  const TrendingChip({super.key, required this.label, required this.imagePath, });

  @override
  Widget build(BuildContext context) {
    return Container(width: 105,height: 50,
      decoration: BoxDecoration(border: const Border(),color: Colors.white,borderRadius: BorderRadius.circular(5),),
      child: Row(
        children: [
          Image.asset(imagePath,width: 45,height: 45,),
          CustomText(text: label,fontSize: 12)
        ],
      ),
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
    );
  }
}
