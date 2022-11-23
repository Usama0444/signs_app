import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class Visitor extends StatefulWidget {
  const Visitor({super.key});

  @override
  State<Visitor> createState() => _VisitorState();
}

class _VisitorState extends State<Visitor> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.visitor.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image.asset(imagesController.visitor[index]),
                );
              }),
        ),
      ),
    );
  }
}
