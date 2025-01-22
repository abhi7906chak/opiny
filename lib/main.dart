import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:opiny/screens/home.dart';
import 'package:opiny/screens/login.dart';
import 'package:opiny/screens/otp.dart';
import 'package:opiny/screens/personal_detail.dart';
import 'package:opiny/screens/profile.dart';
import 'package:opiny/screens/settings.dart';
import 'package:opiny/screens/wallet.dart';
import 'package:opiny/viewModel/get_data_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
// getx universal controller to match data 
  final MatchController matchController = Get.put(MatchController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
      child: GetMaterialApp(
        initialBinding: BindingsBuilder(() {
          Get.put(MatchController());
        }),
        debugShowCheckedModeBanner: false,
        title: 'opiny',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/home',
        routes: {
          '/login': (_) => LoginScreen(),
          '/otp': (_) => OtpScreen(),
          '/home': (_) => const HomeScreen(),
          'profile': (_) => const MyProfileScreen(),
          '/setting': (_) => const SettingsPage(),
          '/personal': (_) => const PersonalDetailsScreen(),
          '/wallet': (_) => const WalletScreen()
        },
      ),
    );
  }
}
