import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_pe/screens/check_balance_main.dart';
import 'package:phone_pe/screens/checking_balance.dart';
import 'package:phone_pe/screens/enter_pin_screen.dart';
import 'package:phone_pe/screens/main_bottom_navbar.dart';
import 'package:phone_pe/screens/main_screen.dart';
import 'package:phone_pe/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'PhonePe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SplashScreen()
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/mainMenu': (context) => MainNavbarScreen(),
          '/checkBalanceMenu': (context) => CheckBalanceMain(),
          '/enterPin': (context) => EnterPinScreen(),
          '/checkingBalance': (context) => CheckingBalance(),
        },
      ),
    );
  }
}