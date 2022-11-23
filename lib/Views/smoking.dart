import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class Smoking extends StatefulWidget {
  const Smoking({super.key});

  @override
  State<Smoking> createState() => _SmokingState();
}

class _SmokingState extends State<Smoking> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.smoking.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image.asset(imagesController.smoking[index]),
                );
              }),
        ),
      ),
    );
  }
}
