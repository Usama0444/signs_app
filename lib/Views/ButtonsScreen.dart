import 'dart:io';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:signs_app/Controller/ImagesController.dart';
import 'package:signs_app/Views/Assembly_sign.dart';
import 'package:signs_app/Views/EmergencySigns.dart';
import 'package:signs_app/Views/FireAdSign.dart';
import 'package:signs_app/Views/Navigation_screen.dart';
import 'package:signs_app/Views/cctv.dart';
import 'package:signs_app/Views/favorite.dart';
import 'package:signs_app/Views/fire_safty.dart';
import 'package:signs_app/Views/foodpre.dart';
import 'package:signs_app/Views/no_Access.dart';
import 'package:signs_app/Views/smoking.dart';
import 'package:signs_app/Views/visitor_sign.dart';
import 'package:signs_app/Views/warning.dart';
import 'package:signs_app/main.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? image;

  var btn = [
    'Emergency Escape Signs',
    'Assembly Point Signs',
    'First Aid Signs',
    'Visitor Signs',
    'Fire Safety Equipment Signs',
    'Smoking Signs',
    'No Access Signs',
    'Warning & Safety Signs',
    'Food Preparation Signs',
    'CCTV Signs',
  ];

  var screens = [
    EmergencySigns(),
    AssemblySign(),
    FireAd(),
    Visitor(),
    FireSafty(),
    Smoking(),
    NoAccess(),
    Warning(),
    FoodPre(),
    CCTV(),
  ];
  var controller = Get.put(MakeImagesPath(), permanent: true);
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    lastScreen();
    controller.fillListWithImagesPath().whenComplete(() {
      setState(() {
        isLoading = false;
        favIndex = 0;
      });
    });
  }

  lastScreen() {
    lastPref?.setString('lastScreen', '/ButtonScreen');
  }

  takeScreenshotAndShare() async {
    await screenshotController.capture(delay: const Duration(milliseconds: 10), pixelRatio: 2.0).then((img) {
      setState(() {
        image = img;
      });
    });

    final dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/screen.png');
    file.writeAsBytes(image!);
    await Share.file('esys image', 'esys.png', image!, 'image/png', text: 'https://play.google.com/store/apps/details?id=com.signApp.android&hl=en&gl=US');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
            bottomNavigationBar: Container(
              height: 50,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: SvgPicture.asset(
                      "assets/exit.svg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const FavoriteScreen());
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset('assets/fav_i.svg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      takeScreenshotAndShare();
                    },
                    child: SvgPicture.asset(
                      "assets/share.svg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            body: isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                : SizedBox(
                    child: ListView.builder(
                        itemCount: btn.length + 1,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index <= btn.length - 1
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(NavigationScreen(
                                          index: index,
                                        ));
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.outbond,
                                                  color: Colors.red,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  btn[index],
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            thickness: 2,
                                          )
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Image.asset('assets/blog.png'),
                                        Image.asset('assets/channel.png'),
                                        Image.asset('assets/rate.png'),
                                      ],
                                    )
                            ],
                          );
                        }),
                  )),
      ),
    );
  }
}
