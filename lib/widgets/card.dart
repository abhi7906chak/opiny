import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';

class TradeCard extends StatelessWidget {
  final String title;
  final String trades;
  final String details;
  final String yesPrice;
  final String noPrice;
  final String imagePath;

  const TradeCard({super.key,
    required this.title,
    required this.details,
    required this.yesPrice,
    required this.noPrice,
    required this.trades, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person,size: 15,),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomText(text: trades,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:CustomText(text: title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 const SizedBox(width: 8),
                Image.asset(imagePath,width: 70,height: 70,),
              ],
            ),
            if (details.isNotEmpty) ...[
              const SizedBox(height: 8),
             CustomText(text: details,
             fontSize: 14, color: Colors.black)
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffe7f5ff),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},

                    child: CustomText(text: 'YES | $yesPrice',color: const Color(0xff41b9ff),fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 5,),
                SizedBox(width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffffd5bd),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: CustomText(text: 'NO | $noPrice',color: const Color(0xffe43834),fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}