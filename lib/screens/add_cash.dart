import 'package:flutter/material.dart';

class AddCashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Add Cash'),
        actions: [const Icon(Icons.help_outline)],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.pink[50],
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'GET A CHANCE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'WIN 100% CASHBACK!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Sign Up with Really Great App Today!',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/50', // Placeholder image
                      ),
                      radius: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Total Balance
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '₹1000.76',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Enter Amount
              const Text(
                'Enter Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [100, 500, 1000, 2000]
                    .map((amount) => ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: Text('₹$amount'),
                ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              // Coupon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Have a Coupon Code?',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Apply Now',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1, height: 30),
              // Summary
              Text(
                'SUMMARY',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
              const SizedBox(height: 10),
              const SummaryRow(title: 'Recharge Amount', value: '₹200.00'),
              const SummaryRow(title: 'GST Applicable', value: '- ₹32.00'),
              const SummaryRow(
                  title: 'Deposit bal. credit', value: '₹117.19', isBold: false),
              const SummaryRow(
                  title: 'Promotional bal. credit',
                  value: '+ ₹32.81',
                  isPositive: true),
              const Divider(thickness: 1, height: 30),
              const SummaryRow(
                  title: 'Net Balance', value: '₹200.00', isBold: true),
              const SizedBox(height: 20),
              // Proceed Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Proceed to Add Cash'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final bool isPositive;

  const SummaryRow({
    Key? key,
    required this.title,
    required this.value,
    this.isBold = false,
    this.isPositive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
              color: isPositive ? Colors.green : Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
              color: isPositive ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
