import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_pe/screens/enter_pin_screen.dart';

import '../const/colors.dart';
import '../const/images.dart';
import '../models/bank_details.dart';

class CheckBalanceMain extends StatefulWidget {
  const CheckBalanceMain({Key? key}) : super(key: key);

  @override
  State<CheckBalanceMain> createState() => _CheckBalanceMainState();
}

class _CheckBalanceMainState extends State<CheckBalanceMain> {

  List<BankDetailsModel> linkedAccounts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addBanksData();
  }

  void addBanksData(){
    BankDetailsModel boi = BankDetailsModel("Bank Of India", Image_Assets.boiImage,"1297",4325.72,"2580");
    BankDetailsModel pnb = BankDetailsModel("Punjab National Bank", Image_Assets.pnbImage,"6110",1257.26,"258012");
    BankDetailsModel sbi = BankDetailsModel("State Bank Of India", Image_Assets.sbiImage,"9865",1485.35,"258012");
    linkedAccounts.add(boi);
    linkedAccounts.add(pnb);
    linkedAccounts.add(sbi);
  }

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
              Icons.arrow_back_sharp,
              color: Colors.white,
            )),
        title: Text(
          "Check Balance",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image(
              image: const AssetImage(Image_Assets.supportAppbar),
              width: 20.w,
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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Powered by  ",
                    style: TextStyle(fontSize: 8.sp),
                  ),
                  Image(
                    image: const AssetImage(Image_Assets.upiLogoImage),
                    width: 25.w,
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
      height: 55.h + (65.0.h * linkedAccounts.length),
      // height: 250,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
           Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Text(
              "Payment Methods on UPI",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          ),
          Container(height: (70.0.h * linkedAccounts.length) , child: linkedAccountsList(linkedAccounts)),
          // const SizedBox(height: 10),
          // bankAccountListTile(Image_Assets.boiImage, "Bank Of India","1297"),
          // const SizedBox(height: 10),
          // customSpacer(),
          // const SizedBox(height: 10),
          // bankAccountListTile(Image_Assets.pnbImage, "Punjab National Bank","6110"),
          // const SizedBox(height: 10),
          // customSpacer(),
          // const SizedBox(height: 10),
          // bankAccountListTile(Image_Assets.sbiImage, "State Bank of India","9865"),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget linkedAccountsList(List<BankDetailsModel> data){
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const SizedBox(height: 10),
              bankAccountListTile(data[index]),
              const SizedBox(height: 10),
              if(index+1 != data.length) // added to add only line in between
                customSpacer(),
            ],
          );
        });
  }
  
  Widget bankAccountListTile(BankDetailsModel bankDetailsModel) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorAssets.bgColorLight,
        onTap: () {
          checkBalance(bankDetailsModel);
        },
        child: SizedBox(
          height: 50.h,
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
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
                      image: AssetImage(bankDetailsModel.imageName),
                      fit: BoxFit.scaleDown,
                      width: 10,
                      height: 10,
                    ),
                  ),
                ),
              ),
              Text("${bankDetailsModel.name} - ${bankDetailsModel.accountNumber}",style: TextStyle(fontSize: 14.sp),),
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

  Widget prepaidListTile(String bankImage, String bankName) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorAssets.bgColorLight,
        onTap: () {
          // checkBalance("Bank of India", "3174");
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
      height: 65.h,
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
            height: 60.h,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, bottom: 4, right: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: AssetImage(Image_Assets.bankStatementImage),
                        fit: BoxFit.scaleDown,
                        width: 45.w,
                        height: 45.h,
                      )),
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bank Statement",style: TextStyle(fontSize: 15.sp),),
                    Text(
                      "PhonePe Account Aggregator",
                      style: TextStyle(fontSize: 11.sp),
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
          prepaidListTile(Image_Assets.upiLiteIconImage, "UPI Lite"),
          const SizedBox(height: 10),
          customSpacer(),
          const SizedBox(height: 10),
          prepaidListTile(
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

  void checkBalance(BankDetailsModel bankData) {
    showLoaderDialog(context);
    Future.delayed(const Duration(seconds: 2)).then((val) {
      Navigator.pushReplacementNamed(context, "/enterPin",arguments: bankData);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => EnterPinScreen()),
      // );
      // Navigator.pop(context);
    });
  }
}
