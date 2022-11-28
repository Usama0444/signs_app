import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Controller/ImagesController.dart';

class NoAccess extends StatefulWidget {
  const NoAccess({super.key});

  @override
  State<NoAccess> createState() => _NoAccessState();
}

class _NoAccessState extends State<NoAccess> {
  var imagesController = Get.find<MakeImagesPath>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView.builder(
              itemCount: imagesController.noAccess.length,
              itemBuilder: (context, index) {
                return index < imagesController.noAccess.length - 1
                    ? SizedBox(
                        child: Image.asset(imagesController.noAccess[index]),
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
