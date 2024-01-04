import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyPad extends StatelessWidget{
  double buttonSize = 55.0;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;
  final int pinLength;

  KeyPad({required this.onChange, required this.onSubmit, required this.pinController, required this.isPinLogin, required this.pinLength});

  @override
  Widget build(BuildContext context) {
    buttonSize = MediaQuery.of(context).size.height*0.085;
    double spaceBetween = 55.w;
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              SizedBox(width: spaceBetween),
              buttonWidget('2'),
              SizedBox(width: spaceBetween),
              buttonWidget('3'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              SizedBox(width: spaceBetween),
              buttonWidget('5'),
              SizedBox(width: spaceBetween),
              buttonWidget('6'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              SizedBox(width: spaceBetween),
              buttonWidget('8'),
              SizedBox(width: spaceBetween),
              buttonWidget('9'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButtonWidget(Icons.backspace, () {
                if (pinController.text.length > 0) {
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > 6) {
                  pinController.text = pinController.text.substring(0, 5);
                }
                onChange(pinController.text);
              },35),
              SizedBox(width: spaceBetween),
              buttonWidget('0'),
              SizedBox(width: spaceBetween),
              !isPinLogin
                  ? iconButtonWidget(Icons.check_circle, () {
                if (pinController.text.length > 6) {
                  pinController.text = pinController.text.substring(0, 5);
                }
                onSubmit(pinController.text);
              },60)
                  : Container(
                width: buttonSize,
              ),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return Container(
      height: buttonSize,
      width: buttonSize*0.8,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(215, 214, 214, 1.0),
        ),
        onPressed: () {
          if (pinController.text.length <= pinLength-1) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.w400,color: Colors.indigo[900],fontSize: 35.sp),
          ),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, VoidCallback function, double size) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
        child: Center(
          child: Icon(icon,
            size: size,
            color: Colors.indigo[900],
          ),
        ),
      ),
    );
  }
}