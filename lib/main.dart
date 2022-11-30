import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signs_app/Controller/ImagesController.dart';
import 'package:signs_app/Views/ButtonsScreen.dart';
import 'package:signs_app/Views/EmergencySigns.dart';
import 'package:signs_app/Views/FireAdSign.dart';
import 'package:signs_app/Views/cctv.dart';
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
  runApp(MyApp());
  pref = await SharedPreferences.getInstance();
  lastPref = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
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
    GetPage(
        name: '/NavigationScreen',
        page: () => NavigationScreen(
              index: 0,
            )),
  ];
  @override
  Widget build(BuildContext context) {
    var c = Get.put(MakeImagesPath(), permanent: true);
    print('last screen');
    print(lastPref?.getString('lastScreen'));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: lastPref?.getString('lastScreen') != null ? '${lastPref?.getString('lastScreen')}' : '/ButtonScreen',
    );
  }
}
