import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_pe/const/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:phone_pe/screens/check_balance_main.dart';

import '../const/images.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 6.h),
            adBanners(),
            SizedBox(height: 6.h),
            transferMoney(),
            SizedBox(height: 6.h),
            receiveMoneyUpiId(receiveMoney),
            SizedBox(height: 6.h),
            upiLiteSection(upiLiteAction),
            SizedBox(height: 6.h),
            rechargeBillPayment(),
            SizedBox(height: 6.h),
            insuranceSection(),
            SizedBox(height: 6.h),
          ],
        ),
    );
  }

  Widget leadingAppbar() {
    return Padding(
      padding: EdgeInsets.only(right: 0.0, left: 15.h, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 50.w,
        width: 40.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 35.w,
              height: 45.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(15.w))),
              child: Center(
                  child: Image(
                image: AssetImage(Image_Assets.avatarPlaceHolder),
                width: 18.w,
              )),
            ),
            Positioned(
              bottom: 0,
              right: -4.h,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1.5.w,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                child: ClipOval(
                    child: Center(
                        child: Image(
                  image: AssetImage(Image_Assets.flagImage),
                  width: 125.w,
                  height: 125.h,
                  fit: BoxFit.cover,
                ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget centerAppbar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            "Add Address",
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
            size: 20.w,
          ),
        ]),
        Text(
          "Patel Nagar",
          style:
              TextStyle(color: const Color.fromRGBO(217, 187, 243, 21), fontSize: 10.sp),
        ),
      ],
    );
  }

  Widget adBanners() {
    return SizedBox(
      height: 125.h,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
            height: 400.h,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            viewportFraction: 1.0),
        items: imgList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      )));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget transferMoney() {
    return Container(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.h))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.h),
            child: Text(
              "Transfer Money",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonsWithIconText(Image_Assets.sendToMobileImage,
                  "To Mobile Number", Send_to_number, 45.h),
              buttonsWithIconText(Image_Assets.sendToUPIImage,
                  "To Bank/   UPI ID", Send_to_Upi, 45.h),
              buttonsWithIconText(Image_Assets.sendToSelfImage,
                  "To Self Account", Send_to_Self, 45.h),
              buttonsWithIconText(Image_Assets.checkBalanceImage,
                  "Check Balance", Check_Balance, 45.h),
            ],
          )
        ],
      ),
    );
  }

  Widget buttonsWithIconText(String imageAsset, String text, VoidCallback callback, double size) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: ColorAssets.bgColorLight,
          onTap: callback,
          child: Container(
            margin: EdgeInsets.all(2),
            width: 65.h,
            height: 80.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(imageAsset),
                  width: size,
                  fit: BoxFit.contain,
                ),
                 SizedBox(
                  height: 6.h,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp, color: Colors.black, height: 1.1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget receiveMoneyUpiId(VoidCallback callback) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: ColorAssets.bgColorLight,
          onTap: callback,
          child: Container(
            height: 60.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 6.0.h),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15.w))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Receive Money",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.qr_code_rounded,
                            size: 16,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "UPI ID:harsh1362@ybl",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget upiLiteSection(VoidCallback callback) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: ColorAssets.bgColorLight,
          onTap: callback,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image(
                      image: AssetImage(Image_Assets.upiLiteImage),
                      width: 65,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: ColorAssets.bgColorLight,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "PIN-less Payments",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "₹3",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rechargeBillPayment() {
    return Container(
      height: 220.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 6.0.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: Text(
                  "Recharge & Bills",
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Container(
                width: 60.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 252, 194, 252),
                  borderRadius: BorderRadius.all(Radius.circular(20.w))
                ),
                child: Center(child: Text("My Bills",style: TextStyle(fontSize: 12.sp),)),
              ),
              SizedBox(width: 15.w,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonsWithIconText(Image_Assets.mobileRechargeImage,
                  "Mobile Recharge", Send_to_number, 25),
              buttonsWithIconText(Image_Assets.dthRechargeImage,
                  "DTH", Send_to_Upi, 30),
              buttonsWithIconText(Image_Assets.electricityBillImage,
                  "Electricity", Send_to_Self, 30),
              buttonsWithIconText(Image_Assets.creditCardBillImage,
                  "Credit Card Bill Payment", Check_Balance, 30),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonsWithIconText(Image_Assets.rentPaymentImage,
                  "Rent   Payment", Send_to_number, 30),
              buttonsWithIconText(Image_Assets.loanPaymentImage,
                  "Loan Repayment", Send_to_Upi, 30),
              buttonsWithIconText(Image_Assets.bookCylinderImage,
                  "Book A Cylinder", Send_to_Self, 25),
              buttonsWithIconText(Image_Assets.seeAllImage,
                  "See All", Check_Balance, 40),
            ],
          )
        ],
      ),
    );
  }

  Widget insuranceSection() {
    return Container(
      height: 225.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Insurance",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonsWithIconText(Image_Assets.bikeInsuranceImage,
                  "Bike", Send_to_number, 35),
              buttonsWithIconText(Image_Assets.carInsuranceImage,
                  "Car", Send_to_Upi, 40),
              buttonsWithIconText(Image_Assets.healthInsuranceImage,
                  "Health", Send_to_Self, 50),
              buttonsWithIconText(Image_Assets.accidentInsuranceImage,
                  "Accident", Check_Balance, 45),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonsWithIconText(Image_Assets.termInsuranceImage,
                  "Term\nLife", Send_to_number, 32),
              buttonsWithIconText(Image_Assets.travelInsuranceImage,
                  "Travel Insurance", Send_to_Upi, 32),
              buttonsWithIconText(Image_Assets.insuranceRenewalImage,
                  "Insurance Renewal", Send_to_Self, 32),
              buttonsWithIconText(Image_Assets.seeAllImage,
                  "See All", Check_Balance, 40),
            ],
          )
        ],
      ),
    );
  }

  void Send_to_number() {
    print("Send Mobile");
  }

  void Send_to_Upi() {
    print("Send_to_Upi");
  }

  void Send_to_Self() {
    print("Send_to_Self");
  }

  void Check_Balance() {
    print("Check_Balance");
    Navigator.pushNamed(
      context,
      '/checkBalanceMenu',
    );
    // Navigator.push(
    //   context,MaterialPageRoute(builder: (context) => CheckBalanceMain()),);
  }

  void receiveMoney() {
    print("receiveMoney");
  }

  void upiLiteAction() {
    print("upiLite");
  }
}
