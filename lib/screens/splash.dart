import 'package:flutter/material.dart';
import 'package:phone_pe/const/images.dart';
import 'package:phone_pe/screens/main_bottom_navbar.dart';
import 'package:phone_pe/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((val) {
      Navigator.pushReplacementNamed(
        context,
        '/mainMenu',
      );
      Navigator.pushReplacement(
        context,MaterialPageRoute(builder: (context) => MainNavbarScreen()),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(image: AssetImage(Image_Assets.splashImage),width: 125,),
      ),
    );
  }
}
