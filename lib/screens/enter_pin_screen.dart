import 'dart:math';

import 'package:flutter/material.dart';
import 'package:phone_pe/const/images.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(215, 214, 214, 1.0),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height:40,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bank of India",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text("XXXX1297"),
                            ],
                          ),
                          Spacer(),
                          Image(
                            image: AssetImage(Image_Assets.upiLogoImage),
                            width: 70,
                            height: 40,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
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
                    const SizedBox(height: 15),
                    const Text("ENTER 4-DIGIT UPI PIN"),
                    const SizedBox(height: 40,),
                    pinSectionWidget(),
                    const SizedBox(height: 60,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color.fromRGBO(252, 237, 166, 1.0),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(Image_Assets.cautionImage),
                              width: 25,
                              height: 25,
                            ),
                          ),
                          Text(
                            "UPI PIN will keep your account\nsecure from unauthorized access.\nDo not share this PIN with anyone.",
                            style: TextStyle(fontSize: 11.5,),textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              KeyPad(
                pinController: pinController,
                isPinLogin: false,
                onChange: (String pin) {
                  print(pin);
                  setState(() {
                    pinLength = pinController.text.length;
                  });
                },
                onSubmit: (String pin) {
                  print(pin);
                  Navigator.pushReplacement(
                    context,MaterialPageRoute(builder: (context) => CheckingBalance()),);
                }
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget pinSectionWidget(){
    return Container(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(pinLength == 0)
          Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: 2,
            color: Colors.black,
          ),
          if(pinLength > 0)
          SizedBox(width: MediaQuery.of(context).size.width*0.15, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1)
            Container(
              width: MediaQuery.of(context).size.width*0.15,
              height: 2,
              color: pinLength == 1 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 1)
            SizedBox(width: MediaQuery.of(context).size.width*0.15, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1 || pinLength == 2)
            Container(
              width: MediaQuery.of(context).size.width*0.15,
              height: 2,
              color: pinLength == 2 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 2)
            SizedBox(width: MediaQuery.of(context).size.width*0.15, child: const Icon(Icons.circle)),
          if(pinLength == 0 || pinLength == 1 || pinLength == 2 || pinLength == 3)
            Container(
              width: MediaQuery.of(context).size.width*0.15,
              height: 2,
              color: pinLength == 3 ? Colors.black : Colors.grey,
            ),
          if(pinLength > 3)
            SizedBox(width: MediaQuery.of(context).size.width*0.15, child: const Icon(Icons.circle)),
        ],
      ),
    );
  }

}
