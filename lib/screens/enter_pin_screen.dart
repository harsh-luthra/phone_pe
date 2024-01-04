import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_pe/const/images.dart';
import 'package:phone_pe/models/bank_details.dart';
import 'package:phone_pe/screens/checking_balance.dart';
import 'package:phone_pe/widgets/keypad.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({Key? key}) : super(key: key);

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

TextEditingController pinController = new TextEditingController();
int pinLength = 0;

class _EnterPinScreenState extends State<EnterPinScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pinController.text = "";
    pinLength = 0;
  }

  @override
  Widget build(BuildContext context) {
    final BankDetailsModel bankData = ModalRoute.of(context)!.settings.arguments as BankDetailsModel;

    return Scaffold(
      backgroundColor: Color.fromRGBO(215, 214, 214, 1.0),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                // const SizedBox(
                //   height:25,
                // ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            SizedBox(width: 5.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bankData.name,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text("XXXX${bankData.accountNumber}",style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),),
                              ],
                            ),
                            const Spacer(),
                            Image(
                              image: const AssetImage(Image_Assets.upiLogoImage),
                              width: 80.w,
                              height: 40.h,
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  Check Balance",
                      textAlign: TextAlign.start,
                    )),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *.45,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      Text("ENTER ${bankData.upiPin.length}-DIGIT UPI PIN"),
                      SizedBox(height: 40.h,),
                      bankData.upiPin.length == 4 ? pinSectionWidget_4(bankData.upiPin.length) : pinSectionWidget_6(bankData.upiPin.length),
                      SizedBox(height: 80.h,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 60.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          color: Color.fromRGBO(252, 237, 166, 0.7),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.w),
                              child: Image(
                                image: AssetImage(Image_Assets.cautionImage),
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                            Text(
                              "UPI PIN will keep your account\nsecure from unauthorized access.\nDo not share this PIN with anyone.",
                              style: TextStyle(height: 1.2, fontSize: 15.sp,color: Colors.black54),textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                KeyPad(
                  pinLength: bankData.upiPin.length,
                  pinController: pinController,
                  isPinLogin: false,
                  onChange: (String pin) {
                    print(pin);
                    setState(() {
                      pinLength = pinController.text.length;
                    });
                  },
                  onSubmit: (String pin) {
                    if(pin.length != bankData.upiPin.length){
                      showCustomSnackBar(bankData.upiPin.length);
                      return;
                    }
                    print(pin);
                    pinController.text = "";
                    pinLength = 0;
                    Navigator.pushReplacementNamed(context, "/checkingBalance",arguments: bankData);
                    // Navigator.pushReplacement(
                    //   context,MaterialPageRoute(builder: (context) => CheckingBalance()),);
                  }
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pinSectionWidget_4(int pinLengthTotal){
    double widthCalc = MediaQuery.of(context).size.width*0.7/pinLengthTotal;
    return SizedBox(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(pinLength == 0)
          Container(
            width: widthCalc,
            height: 2,
            color: Colors.black,
          ),
          if(pinLength > 0)
          SizedBox(width: widthCalc, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 1 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 1)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1 || pinLength == 2)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 2 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 2)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),

          if(pinLength == 0 || pinLength == 1 || pinLength == 2 || pinLength == 3)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 3 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 3)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),
        ],
      ),
    );
  }

  Widget pinSectionWidget_6(int pinLengthTotal){
    double widthCalc = MediaQuery.of(context).size.width*0.7/pinLengthTotal;
    return SizedBox(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(pinLength == 0)
            Container(
              width: widthCalc,
              height: 2,
              color: Colors.black,
            ),
          if(pinLength > 0)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 1 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 1)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1 || pinLength == 2)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 2 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 2)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),

          if(pinLength == 0 || pinLength == 1 || pinLength == 2 || pinLength == 3)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 3 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 3)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),

          // 5

          if(pinLength == 0 || pinLength == 1 || pinLength == 2 || pinLength == 3 || pinLength == 4)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 3 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 4)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),

          // 6

          if(pinLength == 0 || pinLength == 1 || pinLength == 2 || pinLength == 3 || pinLength == 4 || pinLength == 5)
            Container(
              width: widthCalc,
              height: 2,
              color: pinLength == 3 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 5)
            SizedBox(width: widthCalc, child: const Icon(Icons.circle)),

        ],
      ),
    );
  }

  void showCustomSnackBar(int pinLength){
    final snackBar = SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text('Please enter $pinLength digit UPI PIN', textAlign: TextAlign.left),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: EdgeInsets.only(
          bottom: 270.h, left: 0, right: 0),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

