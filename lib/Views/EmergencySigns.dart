import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class EmergencySigns extends StatefulWidget {
  const EmergencySigns({super.key});

  @override
  State<EmergencySigns> createState() => _EmergencySignsState();
}

class _EmergencySignsState extends State<EmergencySigns> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.emergencySign.length,
              itemBuilder: (context, index) {
                return index < imagesController.emergencySign.length - 1
                    ? SizedBox(
                        child: Image.asset(imagesController.emergencySign[index]),
                      )
                    : Column(
                        children: [
                          Image.asset('assets/blog.png'),
                          Image.asset('assets/channel.png'),
                          Image.asset('assets/rate.png'),
                        ],
                      );
              }),
        ),
      ),
    );
  }
}
