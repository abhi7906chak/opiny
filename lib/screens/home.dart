import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';
import 'package:opiny/screens/profile.dart';
import 'package:opiny/viewModel/fatch_data.dart';
import 'package:opiny/widgets/card.dart';
import 'package:opiny/widgets/categories.dart';
import 'package:opiny/widgets/trendings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> trendingItems = [];
  bool isLoading = true; // Added state for loading

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final jsonData = await FatchData().fatchData();
      if (jsonData != null && jsonData.containsKey('data')) {
        setState(() {
          trendingItems = jsonData['data'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load data')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false; // Loading finished
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final match = matchController.match.value!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset(
          'assets/images/profile.png',
          width: 60,
          height: 60,
        ),
        title: Image.asset(
          'assets/images/app_icon.png',
          width: 120,
          height: 150,
        ),
        centerTitle: true,
        actions: [Image.asset('assets/images/notification.png')],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Section
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CategoryIcon(
                    imagePath: 'assets/images/cricket.png',
                    label: 'Cricket',
                  ),
                  CategoryIcon(
                    imagePath: 'assets/images/bitcoin.jpg',
                    label: 'Bitcoin',
                  ),
                  CategoryIcon(
                      imagePath: 'assets/images/television.png',
                      label: 'Entertainment'),
                  CategoryIcon(
                      imagePath: 'assets/images/soccer-ball-variant.png',
                      label: 'Football'),
                  CategoryIcon(
                      imagePath: 'assets/images/conference.png',
                      label: 'Politics'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/cricket.jpg',
                height: 100,
                width: 400,
                fit: BoxFit.fill,
              ),
            ),
            // Trending Section

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      text: 'Trending Now',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 8),
                  isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : const Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.start,
                          children: [
                            TrendingChip(
                              label: "Ind Vs Eng",
                              imagePath: 'assets/images/vs2.png',
                            ),
                            TrendingChip(
                              label: "Sec vs PC",
                              imagePath: 'assets/images/vs2.png',
                            ),
                            TrendingChip(
                              label: "DV vs SWR",
                              imagePath: 'assets/images/vs1.png',
                            ),
                            TrendingChip(
                              label: "UNS vs SRI",
                              imagePath: 'assets/images/vs1.png',
                            ),
                            TrendingChip(
                              
                                label: "AU vs EN",
                                imagePath: 'assets/images/vs3.png'),
                            TrendingChip(
                              label: "SKI vs SRO",
                              imagePath: 'assets/images/vs2.png',
                            ),
                            // const TrendingChip(
                            //     label: 'Bitcoin',
                            //     imagePath: 'assets/images/bitcoin.png'),
                            // const TrendingChip(
                            //     label: 'Youtube',
                            //     imagePath: 'assets/images/youtube.png'),
                            // const TrendingChip(
                            //     label: 'Stocks',
                            //     imagePath: 'assets/images/dollar.png'),
                          ],
                        ),
                ],
              ),
            ),
            // Trades Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TradeCard(
                    trades: '680674 Trades',
                    title: 'ENG to win the 3rd T20I match vs WI?',
                    details: 'H2H last 5 T20: IN 4, WI 1, DRAW 0',
                    yesPrice: '₹6',
                    noPrice: '₹4',
                    imagePath: 'assets/images/vs4.png',
                  ),
                  TradeCard(
                    trades: '680674 Trades',
                    title:
                        'Bitcoin to be priced at 89940.04 USDT or more at 06:55 pm?',
                    details: '',
                    yesPrice: '₹6',
                    noPrice: '₹4',
                    imagePath: 'assets/images/bitcoin.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 2) {
            // Navigate to Profile Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyProfileScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushNamed(context, '/wallet');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard), label: 'Profile'),
        ],
      ),
    );
  }
}
