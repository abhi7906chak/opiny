import 'package:flutter/material.dart';

import '../custom_text.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Wallet'),
        centerTitle: true,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBalanceCard(isSmallScreen),
                const SizedBox(height: 20),
                _buildRewardsSection(isSmallScreen),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceCard(bool isSmallScreen) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(text:
              '₹1000.76',
               fontSize: 24, fontWeight: FontWeight.bold),
            const SizedBox(height: 8),
             const CustomText(text:
              'Total Balance',
              color: Colors.grey, fontSize: 16),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton('My Transactions', isSmallScreen),
                _buildButton('History', isSmallScreen),
                _buildButton('Statement', isSmallScreen),
              ],
            ),
            const Divider(height: 32, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBalanceTile(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Deposit Amount',
                  amount: '₹250',
                  buttonLabel: 'Add Cash',
                  buttonColor: Colors.blue,
                ),
                _buildBalanceTile(
                  icon: Icons.emoji_events_outlined,
                  title: 'Winner Amount',
                  amount: '₹750.76',
                  buttonLabel: 'Withdraw',
                  buttonColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text:
          'My Rewards',
fontSize: 18, fontWeight: FontWeight.bold),
        const SizedBox(height: 12),
        _buildRewardTile(
          icon: Icons.card_giftcard_outlined,
          title: 'Cash Bonus',
          subtitle: '₹750.76',
        ),
        _buildRewardTile(
          icon: Icons.money_outlined,
          title: 'Withdraw Money',
          subtitle: 'Instantly Withdraw your Winnings',
        ),
        _buildRewardTile(
          icon: Icons.support_agent_outlined,
          title: '24*7 Help & Support',
          subtitle: 'Get 24*7 Support for your queries and Concerns',
        ),
      ],
    );
  }

  Widget _buildButton(String title, bool isSmallScreen) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: isSmallScreen ? 12 : 14),
      ),
      child: CustomText(text:title),
    );
  }

  Widget _buildBalanceTile({
    required IconData icon,
    required String title,
    required String amount,
    required String buttonLabel,
    required Color buttonColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 32),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: title, fontSize: 12),
                  CustomText(text:amount, fontWeight: FontWeight.bold, fontSize: 18)
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: CustomText(text:buttonLabel),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, size: 32, color: Colors.black),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
