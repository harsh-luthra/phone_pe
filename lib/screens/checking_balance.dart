import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_pe/const/images.dart';

class CheckingBalance extends StatefulWidget {
  const CheckingBalance({Key? key}) : super(key: key);

  @override
  State<CheckingBalance> createState() => _CheckingBalanceState();
}

class _CheckingBalanceState extends State<CheckingBalance> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Text(""),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.orange,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: balanceCheckedDone(),
    );
  }

  Widget checkingBalance(){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(
            height: 150.0,
            width: 150.0,
            child: CircularProgressIndicator(color: Colors.orange, strokeWidth: 8,),
          ),
          SizedBox(height: 25),
          Text("    Fetching balance",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          SizedBox(height: 50),
          Spacer(),
          Text("Please do not press back or close the app",style: TextStyle(fontSize: 10),),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget balanceCheckedDone(){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 180.0,
            width: 180.0,
            child: Image(image: AssetImage(Image_Assets.greenTickAnimatedImage),width: 180, )
          ),
          SizedBox(height: 25),
          Text("Available Balance fetched\nsuccessfully",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          SizedBox(height: 50),
          Spacer(),
          Text("Please do not press back or close the app",style: TextStyle(fontSize: 10),),
          SizedBox(height: 10),
        ],
      ),
    );
  }



}
