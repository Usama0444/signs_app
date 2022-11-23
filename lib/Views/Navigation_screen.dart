import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:signs_app/Views/navbarScreens/exit.dart';
import 'package:signs_app/Views/navbarScreens/index.dart';
import 'package:signs_app/Views/navbarScreens/left.dart';
import 'package:signs_app/Views/navbarScreens/right.dart';
import 'package:signs_app/Views/navbarScreens/share.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  List<Widget> widgetList = [
    Exit(),
    Left(),
    Index(),
    Right(),
    Share(),
  ];
  bool _check = false;
  void getScreen(int index) {
    switch (index) {
      case 0:
        setState(() {
          currentIndex = 0;
        });
        break;
      case 1:
        if (currentIndex > 0) {
          setState(() {
            currentIndex--;
          });
        } else {
          setState(() {
            currentIndex = 0;
          });
        }
        break;
      case 2:
        setState(() {
          currentIndex = 2;
        });
        break;
      case 3:
        if (currentIndex < 4 && currentIndex == 0) {
          setState(() {
            currentIndex++;
          });
        } else {
          setState(() {
            currentIndex = 4;
          });
        }
        break;
      case 4:
        setState(() {
          currentIndex = 4;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetList[currentIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap:() =>  getScreen(0),
              child: SvgPicture.asset(
                "assets/exit.svg",
                height: 32,
                width: 32,
              ),
            ),
            InkWell(
              onTap:() =>  getScreen(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/left.svg", height: 32, width: 32),
                  Text("Prev")
                ],
              ),
            ),
            InkWell(
              onTap:() =>  getScreen(2),
              child: SvgPicture.asset("assets/index.svg", height: 32, width: 32)),
            InkWell(
              onTap:() =>  getScreen(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/right.svg", height: 32, width: 32),
                  Text("Next")
                ],
              ),
            ),
            InkWell(
              onTap:() =>  getScreen(4),
              child: SvgPicture.asset("assets/share.svg", height: 32, width: 32))
          ],
        ),
      ),
    );
  }
}
