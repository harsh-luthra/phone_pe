import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:phone_pe/const/images.dart';
import 'package:intl/intl.dart';

import '../const/colors.dart';
import '../models/bank_details.dart';

import 'package:lottie/lottie.dart';

class CheckingBalance extends StatefulWidget {
  const CheckingBalance({Key? key}) : super(key: key);

  @override
  State<CheckingBalance> createState() => _CheckingBalanceState();
}

class _CheckingBalanceState extends State<CheckingBalance>
    with TickerProviderStateMixin {
  late final GifController controller1;

  late AnimationController _controller;
  late Animation<double> _animation;

  bool loading = true;

  double _balance = 9500.72;

  @override
  void initState() {
    controller1 = GifController(vsync: this);
    super.initState();

    // Create an animation controller with a duration of 1 second
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    // Create a Tween that interpolates between 1.0 and 0.5
    _animation = Tween<double>(begin: 1.0, end: 0.75).animate(_controller);

    // Add a listener to rebuild the widget when the animation value changes
    _controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation indefinitely
    _controller.repeat(reverse: true);

    checkTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkTimer() {
    _controller.stop();
    _controller.reset();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        loading = false;
      });
      Future.delayed(const Duration(milliseconds: 2200)).then((value) {
        _controller.repeat(reverse: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final BankDetailsModel bankData = ModalRoute.of(context)!.settings.arguments as BankDetailsModel;
    _balance = bankData.balance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Text(""),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: loading ? Colors.orange : Colors.green,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: loading ? checkingBalance() : balanceCheckedDone_stack(bankData),
    );
  }

  Widget checkingBalance() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: 180.0.w,
            width: 180.0.w,
            // child: CircularProgressIndicator(
            //   color: Colors.orange,
            //   strokeWidth: 8.w,
            // ),
            child: Lottie.asset("assets/animation/pending_orange_loader.json"),
          ),
          SizedBox(height: 25.h),
          Text(
            "    Fetching balance",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
          SizedBox(height: 50.h),
          const Spacer(),
          Text(
            "Please do not press back or close the app",
            style: TextStyle(fontSize: 10.sp),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget balanceCheckedDone() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 180.0,
          //   width: 180.0,
          //   // child: Image(image: AssetImage(Image_Assets.greenTickAnimatedImage),width: 180, )
          //   child: Gif(
          //     autostart: Autostart.once,
          //     placeholder: (context) =>
          //     const Center(child: CircularProgressIndicator()),
          //     image: const AssetImage(Image_Assets.greenTickAnimatedImage),
          //   ),
          // ),
          Container(
            // height: 180.0,
            // width: 180.0,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              // width: 100 * _animation.value,
              // height: 100 * _animation.value,
              child: Gif(
                width: 75 * _animation.value,
                height: 75 * _animation.value,
                autostart: Autostart.once,
                placeholder: (context) =>
                    const Center(child: CircularProgressIndicator()),
                image: const AssetImage(Image_Assets.greenTickAnimatedImage),
              ), // Replace with your image asset path
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Available Balance fetched\nsuccessfully",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(height: 50),
          Spacer(),
          Text(
            "Please do not press back or close the app",
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget balanceCheckedDone_stack(BankDetailsModel bankData) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -0,
            child: Container(
              child: Transform.scale(
                scale: _animation.value,
                // duration: Duration(seconds: 2),
                child: Gif(
                  width: 150.w,
                  height: 150.h,
                  autostart: Autostart.once,
                  placeholder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                  image: const AssetImage(Image_Assets.greenTickAnimatedImage),
                ), // Replace with your image asset path
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.28,
              child: Column(
                children: [
                  Text(
                    "Available Balance fetched\nsuccessfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21.sp, height: 1.1),
                  ),
                  SizedBox(height: 20.h),
                  bankAccountListTile(bankData),
                  Text(
                    "Available Balance",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Text(formatCurrency(_balance),
                      style: TextStyle(
                        fontSize: 30.sp,
                      )),
                ],
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey, // Set the border color
                        width: 0.25, // Set the border width
                      ),
                    ),
                    shape: BoxShape.rectangle),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("DONE", style: TextStyle(fontSize: 18)),
                ),
              )),
        ],
      ),
    );
  }

  String formatCurrency(double amount) {
    // Create a NumberFormat instance for formatting with commas and currency symbol
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    // Format the number using the NumberFormat instance
    return currencyFormat.format(amount);
  }

  Widget bankAccountListTile(BankDetailsModel bankDetailsModel) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(3.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: AssetImage(bankDetailsModel.imageName),
                  fit: BoxFit.scaleDown,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ),
          Text("${bankDetailsModel.name} - ${bankDetailsModel.accountNumber}"),
        ],
      ),
    );
  }
}
