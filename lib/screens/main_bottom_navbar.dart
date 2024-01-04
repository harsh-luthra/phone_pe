import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_pe/screens/main_screen.dart';

import '../const/colors.dart';
import '../const/images.dart';

class MainNavbarScreen extends StatefulWidget {
  const MainNavbarScreen({Key? key}) : super(key: key);

  @override
  State<MainNavbarScreen> createState() => _MainNavbarScreenState();
}

int _selectedIndex = 0;

class _MainNavbarScreenState extends State<MainNavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.bgColorLight,
      appBar: AppBar(
        backgroundColor: ColorAssets.mainColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorAssets.mainColorLight,
          statusBarIconBrightness: Brightness.light,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: leadingAppbar(),
        title: centerAppbar(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(image: AssetImage(Image_Assets.qrAppbar)),
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            iconSize: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -10,
                    right: -6,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(45, 157, 102, 1),
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the value for desired rounding
                      ),
                      child: const Center(
                          child: Text(
                        "6",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )),
                    )),
                const Image(image: AssetImage(Image_Assets.notiAppbar)),
              ],
            ),
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          ),
          IconButton(
            onPressed: () {},
            icon: const Image(image: AssetImage(Image_Assets.supportAppbar)),
            padding:
                const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 20),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: ColorAssets.mainColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: ColorAssets.mainColor),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage(Image_Assets.bottomHomeImage), width: 25),
            label: 'Home',
            activeIcon: Image(
                image: AssetImage(Image_Assets.bottomHomeImage), width: 25),
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage(Image_Assets.bottomCreditImageUn), width: 25),
            label: 'Credit',
            activeIcon: Image(
                image: AssetImage(Image_Assets.bottomCreditImageUn), width: 25),
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage(Image_Assets.bottomInsuranceImageUn), width: 25),
            label: 'Insurance',
            activeIcon: Image(
                image: AssetImage(Image_Assets.bottomInsuranceImageUn), width: 25),
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage(Image_Assets.bottomWealthImageUn), width: 25),
            label: 'Wealth',
            activeIcon: Image(
                image: AssetImage(Image_Assets.bottomWealthImageUn), width: 25),
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage(Image_Assets.bottomHistoryImageUn), width: 25),
            label: 'History',
            activeIcon: Image(
                image: AssetImage(Image_Assets.bottomHistoryImageUn), width: 25),
          ),
        ],
      ),
      body: const MainScreen(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget leadingAppbar() {
    return Padding(
      padding:
          const EdgeInsets.only(right: 0.0, left: 15.0, top: 10, bottom: 10),
      child: SizedBox(
        height: 50,
        width: 40,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 35,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: const Center(
                  child: Image(
                image: AssetImage(Image_Assets.avatarPlaceHolder),
                width: 18,
              )),
            ),
            Positioned(
              bottom: 0,
              right: -4,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const ClipOval(
                    child: Center(
                        child: Image(
                  image: AssetImage(Image_Assets.flagImage),
                  width: 125,
                  height: 125,
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
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
            size: 20,
          ),
        ]),
        Text(
          "Rohtak SubDistrict",
          style:
              TextStyle(color: Color.fromRGBO(217, 187, 243, 21), fontSize: 10),
        ),
      ],
    );
  }
}
