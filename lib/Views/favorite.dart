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
import 'package:signs_app/Views/fire_safty.dart';
import 'package:signs_app/Views/foodpre.dart';
import 'package:signs_app/Views/no_Access.dart';
import 'package:signs_app/Views/smoking.dart';
import 'package:signs_app/Views/visitor_sign.dart';
import 'package:signs_app/Views/warning.dart';

import '../main.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var controller = Get.put(MakeImagesPath(), permanent: true);
  bool isLoading = true;
  var keyName = [];
  var keyValues = [];

  getKeysAndValues() async {
    final keys = pref?.getKeys();

    final prefsMap = Map<String, dynamic>();
    for (String key in keys!) {
      prefsMap[key] = pref?.get(key);
    }
    print(prefsMap);
    prefsMap.forEach((key, value) {
      keyName.add(key);
      keyValues.add(value);
    });
    print('keys ${keyName}');
    print('key values ${keyValues}');
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getKeysAndValues();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
            : SizedBox(
                child: ListView.builder(
                    itemCount: keyName.length,
                    itemBuilder: (context, index) {
                      var split = keyName[index].toString().split('_');
                      return InkWell(
                        onTap: () {
                          var str = split[0];

                          setState(() {
                            favIndex = keyValues[index];
                          });
                          if (str == 'EmergencySigns') {
                            Get.to(NavigationScreen(index: 0));
                          } else if (str == 'AssemblySign') {
                            Get.to(NavigationScreen(index: 1));
                          } else if (str == 'FireAd') {
                            Get.to(NavigationScreen(index: 2));
                          } else if (str == 'Visitor') {
                            Get.to(NavigationScreen(index: 3));
                          } else if (str == 'FireSafty') {
                            Get.to(NavigationScreen(index: 4));
                          } else if (str == 'Smoking') {
                            Get.to(NavigationScreen(index: 5));
                          } else if (str == 'NoAccess') {
                            Get.to(NavigationScreen(index: 6));
                          } else if (str == 'Warning') {
                            Get.to(NavigationScreen(index: 7));
                          } else if (str == 'FoodPre') {
                            Get.to(NavigationScreen(index: 8));
                          } else if (str == 'CCTV') {
                            Get.to(NavigationScreen(index: 9));
                          }
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
                                    split[1],
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
                      );
                    }),
              ),
      ),
    );
  }
}