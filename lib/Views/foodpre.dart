import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class FoodPre extends StatefulWidget {
  const FoodPre({super.key});

  @override
  State<FoodPre> createState() => _FoodPreState();
}

class _FoodPreState extends State<FoodPre> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.foodPre.length,
              itemBuilder: (context, index) {
                return index < imagesController.foodPre.length - 1
                    ? SizedBox(
                        child: Image.asset(imagesController.foodPre[index]),
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
