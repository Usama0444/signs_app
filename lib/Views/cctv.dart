import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class CCTV extends StatefulWidget {
  const CCTV({super.key});

  @override
  State<CCTV> createState() => _CCTVState();
}

class _CCTVState extends State<CCTV> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.cctv.length,
              itemBuilder: (context, index) {
                return index < imagesController.cctv.length - 1
                    ? SizedBox(
                        child: Image.asset(imagesController.cctv[index]),
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
