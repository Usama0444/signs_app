import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class FireAd extends StatefulWidget {
  const FireAd({super.key});

  @override
  State<FireAd> createState() => _FireAdState();
}

class _FireAdState extends State<FireAd> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.fireAid.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image.asset(imagesController.fireAid[index]),
                );
              }),
        ),
      ),
    );
  }
}
