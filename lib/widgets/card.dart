import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';

class TradeCard extends StatelessWidget {
  final String title;
  final String trades;
  final String details;
  final String yesPrice;
  final String noPrice;
  final String imagePath;

  const TradeCard({
    super.key,
    required this.title,
    required this.details,
    required this.yesPrice,
    required this.noPrice,
    required this.trades,
    required this.imagePath,
  });

  void _showBottomDrawer(BuildContext context, String option) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        bool isYes = option == "YES";
        double price = isYes ? 3.6 : 6.4;
        double youGet = 10.0;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            int quantity = 1;
            double total = price * quantity;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sydney Thunder to win the Knockout vs Melbourne Stars?',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isYes
                                ? const Color(0xff41b9ff)
                                : const Color(0xffffd5bd),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Yes ₹${price.toStringAsFixed(1)}',
                            style: TextStyle(
                              color: isYes
                                  ? Colors.white
                                  : const Color(0xffe43834),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !isYes
                                ? const Color(0xffe43834)
                                : const Color(0xff41b9ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'No ₹${price.toStringAsFixed(1)}',
                            style: TextStyle(
                              color: isYes
                                  ? const Color(0xff41b9ff)
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                            total = price * quantity;
                          });
                        },
                        icon: const Icon(Icons.remove_circle),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                            total = price * quantity;
                          });
                        },
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${total.toStringAsFixed(1)} You Put In',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '₹${youGet.toStringAsFixed(1)} You Get',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isYes
                          ? const Color(0xff41b9ff)
                          : const Color(0xffe43834),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle Swipe or Confirm Logic
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Swipe for ${option}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Available Balance: ₹15.00',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 15),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomText(
                    text: trades,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  imagePath,
                  width: 70,
                  height: 70,
                ),
              ],
            ),
            if (details.isNotEmpty) ...[
              const SizedBox(height: 8),
              CustomText(text: details, fontSize: 14, color: Colors.black),
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffe7f5ff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () => _showBottomDrawer(context, 'YES'),
                    child: CustomText(
                      text: 'YES | $yesPrice',
                      color: const Color(0xff41b9ff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffd5bd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () => _showBottomDrawer(context, 'NO'),
                    child: CustomText(
                      text: 'NO | $noPrice',
                      color: const Color(0xffe43834),
                      fontWeight: FontWeight.bold,
                    ),
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
