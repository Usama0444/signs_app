import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:signs_app/Views/Assembly_sign.dart';
import 'package:signs_app/Views/ButtonsScreen.dart';
import 'package:signs_app/Views/EmergencySigns.dart';
import 'package:signs_app/Views/FireAdSign.dart';
import 'package:signs_app/Views/cctv.dart';
import 'package:signs_app/Views/fire_safty.dart';
import 'package:signs_app/Views/foodpre.dart';
import 'package:signs_app/Views/navbarScreens/exit.dart';
import 'package:signs_app/Views/navbarScreens/index.dart';
import 'package:signs_app/Views/navbarScreens/left.dart';
import 'package:signs_app/Views/navbarScreens/right.dart';
import 'package:signs_app/Views/navbarScreens/share.dart';
import 'package:signs_app/Views/no_Access.dart';
import 'package:signs_app/Views/smoking.dart';
import 'package:signs_app/Views/visitor_sign.dart';
import 'package:signs_app/Views/warning.dart';

class NavigationScreen extends StatefulWidget {
  int index;
  NavigationScreen({super.key, required this.index});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int currentIndex;
  List<Widget> widgetList = [
    const EmergencySigns(),
    const AssemblySign(),
    const FireAd(),
    const Visitor(),
    const FireSafty(),
    const Smoking(),
    const NoAccess(),
    const Warning(),
    const FoodPre(),
    const CCTV(),
  ];

  void getScreen(int index) {
    if (index == 0) {
      SystemNavigator.pop();
    } else if (index == 1) {
      if (currentIndex > 0) {
        currentIndex--;
      }
    } else if (index == 2) {
      Get.to(const ButtonScreen());
    } else if (index == 3) {
      if (currentIndex < widgetList.length - 1) {
        currentIndex++;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    currentIndexInit();
  }

  currentIndexInit() {
    currentIndex = widget.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: widgetList[currentIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => getScreen(0),
              child: Image.asset(
                "assets/exit.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap: () => getScreen(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/left.svg",
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                  const Text("Prev")
                ],
              ),
            ),
            InkWell(
                onTap: () => getScreen(2),
                child: Image.asset(
                  "assets/index.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )),
            InkWell(
              onTap: () => getScreen(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/right.svg",
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                  const Text("Next")
                ],
              ),
            ),
            InkWell(
                onTap: () => getScreen(4),
                child: Image.asset(
                  "assets/share.png",
                  height: 42,
                  width: 42,
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
