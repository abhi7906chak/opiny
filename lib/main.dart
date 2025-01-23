import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
=======
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
import 'package:opiny/screens/home.dart';
import 'package:opiny/screens/login.dart';
import 'package:opiny/screens/otp.dart';
import 'package:opiny/screens/personal_detail.dart';
import 'package:opiny/screens/profile.dart';
import 'package:opiny/screens/settings.dart';
import 'package:opiny/screens/wallet.dart';
<<<<<<< HEAD
// import 'package:opiny/viewModel/get_data_controller.dart';
=======
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
<<<<<<< HEAD
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // getx universal controller to match data
  // final MatchController matchController = Get.put(MatchController());
=======
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
<<<<<<< HEAD
      child: GetMaterialApp(
        // initialBinding: BindingsBuilder(() {
        //   Get.put(MatchController());
        // }),
        debugShowCheckedModeBanner: false,
        title: 'Opiny',
=======
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'opiny',
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => LoginScreen(),
          '/otp': (_) => OtpScreen(),
          '/home': (_) => const HomeScreen(),
<<<<<<< HEAD
          '/profile': (_) =>
              const MyProfileScreen(), // Updated this route to be '/profile'
          '/setting': (_) => const SettingsPage(),
          '/personal': (_) => const PersonalDetailsScreen(),
          '/wallet': (_) => const WalletScreen(),
=======
          'profile':(_)=> const MyProfileScreen(),
          '/setting':(_)=>const SettingsPage(),
          '/personal':(_)=>const PersonalDetailsScreen(),
          '/wallet':(_)=>const WalletScreen()
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
        },
      ),
    );
  }
}
