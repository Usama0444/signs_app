import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class AssemblySign extends StatefulWidget {
  const AssemblySign({super.key});

  @override
  State<AssemblySign> createState() => _AssemblySignState();
}

class _AssemblySignState extends State<AssemblySign> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.assemblySign.length,
              itemBuilder: (context, index) {
                return index < imagesController.assemblySign.length - 1
                    ? SizedBox(
                        child: Image.asset(imagesController.assemblySign[index]),
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
