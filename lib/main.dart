import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signs_app/Controller/ImagesController.dart';
import 'package:signs_app/Views/ButtonsScreen.dart';
import 'package:signs_app/Views/EmergencySigns.dart';
import 'package:signs_app/Views/FireAdSign.dart';
import 'package:signs_app/Views/cctv.dart';
import 'package:signs_app/Views/favorite.dart';
import 'package:signs_app/Views/fire_safty.dart';
import 'package:signs_app/Views/foodpre.dart';
import 'package:signs_app/Views/no_Access.dart';
import 'package:signs_app/Views/smoking.dart';
import 'package:signs_app/Views/visitor_sign.dart';
import 'package:signs_app/Views/warning.dart';
import 'package:signs_app/test.dart';

import '/Views/Navigation_screen.dart';
import 'Views/Assembly_sign.dart';

SharedPreferences? pref;
SharedPreferences? lastPref;

int favIndex = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  lastPref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = [
    GetPage(name: '/EmergencySigns', page: () => EmergencySigns()),
    GetPage(name: '/AssemblySign', page: () => const AssemblySign()),
    GetPage(name: '/FireAd', page: () => const FireAd()),
    GetPage(name: '/Visitor', page: () => const Visitor()),
    GetPage(name: '/FireSafty', page: () => const FireSafty()),
    GetPage(name: '/Smoking', page: () => const Smoking()),
    GetPage(name: '/NoAccess', page: () => const NoAccess()),
    GetPage(name: '/Warning', page: () => const Warning()),
    GetPage(name: '/FoodPre', page: () => const FoodPre()),
    GetPage(name: '/CCTV', page: () => const CCTV()),
    GetPage(name: '/ButtonScreen', page: () => const ButtonScreen()),
    GetPage(name: '/FavoriteScreen', page: () => const FavoriteScreen()),
    GetPage(name: '/NavigationScreen_0', page: () => NavigationScreen(index: 0)),
    GetPage(name: '/NavigationScreen_1', page: () => NavigationScreen(index: 1)),
    GetPage(name: '/NavigationScreen_2', page: () => NavigationScreen(index: 2)),
    GetPage(name: '/NavigationScreen_3', page: () => NavigationScreen(index: 3)),
    GetPage(name: '/NavigationScreen_4', page: () => NavigationScreen(index: 4)),
    GetPage(name: '/NavigationScreen_5', page: () => NavigationScreen(index: 5)),
    GetPage(name: '/NavigationScreen_6', page: () => NavigationScreen(index: 6)),
    GetPage(name: '/NavigationScreen_7', page: () => NavigationScreen(index: 7)),
    GetPage(name: '/NavigationScreen_8', page: () => NavigationScreen(index: 8)),
    GetPage(name: '/NavigationScreen_9', page: () => NavigationScreen(index: 9)),
  ];
  var controller = Get.put(MakeImagesPath(), permanent: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fillListWithImagesPath().whenComplete(() {
      setState(() {
        favIndex = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('last screen');
    print(lastPref?.getString('lastScreen'));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: lastPref?.getString('lastScreen') != null ? '${lastPref?.getString('lastScreen')}' : '/ButtonScreen',
    );
  }
}
