import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:signs_app/main.dart';

import '../Controller/ImagesController.dart';

class EmergencySigns extends StatefulWidget {
  EmergencySigns({
    super.key,
  });

  @override
  State<EmergencySigns> createState() => _EmergencySignsState();
}

class _EmergencySignsState extends State<EmergencySigns> {
  var imagesController = Get.find<MakeImagesPath>();
  TextEditingController favController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastPref?.setString('lastScreen', '/NavigationScreen_0');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ScrollablePositionedList.builder(
              initialScrollIndex: favIndex,
              itemCount: imagesController.emergencySign.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        index < imagesController.emergencySign.length - 1
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  child: Image.asset(imagesController.emergencySign[index]),
                                ),
                              )
                            : Column(
                                children: [
                                  Image.asset('assets/blog.png'),
                                  Image.asset('assets/channel.png'),
                                  Image.asset('assets/rate.png'),
                                ],
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  favController.text = '';
                                });
                                Get.dialog(Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 350,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: 300,
                                                  height: 50,
                                                  child: TextFormField(
                                                    controller: favController,
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                                      label: const Text('Enter icon name'),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    SizedBox(
                                                        width: 150,
                                                        height: 30,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              if (favController.text.trim().isEmpty) {
                                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                  content: Text('please Enter String first'),
                                                                  padding: EdgeInsets.all(20),
                                                                  duration: Duration(seconds: 1),
                                                                ));
                                                              } else {
                                                                pref?.setInt('EmergencySigns_${favController.text}', index);
                                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                  content: Text('favorite added'),
                                                                  padding: EdgeInsets.all(20),
                                                                  duration: Duration(seconds: 1),
                                                                ));
                                                                Get.back();
                                                              }
                                                            },
                                                            child: const Text('Add to favorite'))),
                                                    SizedBox(
                                                        width: 150,
                                                        height: 30,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text('Cancel'))),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              },
                              child: Icon(
                                Icons.favorite,
                                color: Colors.black.withOpacity(.6),
                                size: 40,
                              )),
                        ),
                      ],
                    ),
                    (index + 1) % 4 == 0 && index != 0
                        ? const SizedBox(
                            height: 70,
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
