import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_pe/screens/enter_pin_screen.dart';

import '../const/colors.dart';
import '../const/images.dart';

class CheckBalanceMain extends StatefulWidget {
  const CheckBalanceMain({Key? key}) : super(key: key);

  @override
  State<CheckBalanceMain> createState() => _CheckBalanceMainState();
}

class _CheckBalanceMainState extends State<CheckBalanceMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.bgColorLight,
      appBar: AppBar(
        backgroundColor: ColorAssets.mainColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorAssets.mainColorLight,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        title: const Text(
          "Check Balance",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(Image_Assets.supportAppbar),
              width: 20,
            ),
            padding:
                const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 6),
            methodsOnUPI(),
            const SizedBox(height: 6),
            bankStatement(),
            const SizedBox(height: 6),
            prePaidBalance(),
            const SizedBox(height: 6),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Powered by  ",
                    style: TextStyle(fontSize: 8),
                  ),
                  Image(
                    image: AssetImage(Image_Assets.upiLogoImage),
                    width: 25,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget methodsOnUPI() {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Payment Methods on UPI",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 10),
          bankAccountListTile(Image_Assets.boiImage, "Bank Of India - 1297"),
          const SizedBox(height: 10),
          customSpacer(),
          const SizedBox(height: 10),
          bankAccountListTile(
              Image_Assets.pnbImage, "Punjab National Bank - 6110"),
          const SizedBox(height: 10),
          customSpacer(),
          const SizedBox(height: 10),
          bankAccountListTile(
              Image_Assets.sbiImage, "State Bank of India - 9865"),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget bankAccountListTile(String bankImage, String bankName) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorAssets.bgColorLight,
        onTap: () {
          checkBalance("Bank of India", "3174");
        },
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: AssetImage(bankImage),
                      fit: BoxFit.scaleDown,
                      width: 10,
                      height: 10,
                    ),
                  ),
                ),
              ),
              Text(bankName),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget bankStatement() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: ColorAssets.bgColorLight,
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, bottom: 4, right: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: const Image(
                        image: AssetImage(Image_Assets.bankStatementImage),
                        fit: BoxFit.scaleDown,
                        width: 40,
                        height: 40,
                      )),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bank Statement"),
                    Text(
                      "PhonePe Account Aggregator",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget prePaidBalance() {
    return Container(
      height: 175,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Pre-Paid Balance",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 0),
          bankAccountListTile(Image_Assets.upiLiteIconImage, "UPI Lite"),
          const SizedBox(height: 10),
          customSpacer(),
          const SizedBox(height: 10),
          bankAccountListTile(
              Image_Assets.phonePeWalletImage, "PhonePe Wallet"),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Column(
  // mainAxisAlignment: MainAxisAlignment.start,
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // Text("Bank Statement"),
  // Text("PhonePe Account Aggregator",style: TextStyle(fontSize: 10),)
  // ],
  // ),

  Widget customSpacer() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 1,
        color: ColorAssets.bgColorLight,
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void checkBalance(String bankAccount, String Pin) {
    showLoaderDialog(context);
    Future.delayed(const Duration(seconds: 2)).then((val) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EnterPinScreen()),
      );
      // Navigator.pop(context);
    });
  }
}
