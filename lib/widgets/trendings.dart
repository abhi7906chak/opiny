import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';

class TrendingChip extends StatelessWidget {
  final String label;
  final String imagePath;


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
    );
  }
}
