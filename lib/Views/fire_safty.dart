import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class FireSafty extends StatefulWidget {
  const FireSafty({super.key});

  @override
  State<FireSafty> createState() => _FireSaftyState();
}

class _FireSaftyState extends State<FireSafty> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.fireSafty.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image.asset(imagesController.fireSafty[index]),
                );
              }),
        ),
      ),
    );
  }
}
