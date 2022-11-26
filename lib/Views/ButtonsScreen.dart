import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
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

  var screens = const [
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
    // TODO: implement initState
    super.initState();
    controller.fillListWithImagesPath().whenComplete(() {
      setState(() {
        isLoading = false;
        print('print..........');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: Image.asset(
                    'assets/exit.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset('assets/fav.svg'),
                ),
                Image.asset(
                  'assets/share.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
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
                      itemCount: btn.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
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
                        );
                      }),
                )),
    );
  }
}
