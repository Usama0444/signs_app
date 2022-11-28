import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signs_app/Controller/ImagesController.dart';
import 'package:signs_app/Views/ButtonsScreen.dart';
import 'package:signs_app/test.dart';

import '/Views/Navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var c = Get.put(MakeImagesPath(), permanent: true);
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonScreen(),
    );
  }
}
