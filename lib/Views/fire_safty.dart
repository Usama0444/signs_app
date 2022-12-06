import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../Controller/ImagesController.dart';
import '../main.dart';

class FireSafty extends StatefulWidget {
  const FireSafty({super.key});

  @override
  State<FireSafty> createState() => _FireSaftyState();
}

class _FireSaftyState extends State<FireSafty> {
  var imagesController = Get.find<MakeImagesPath>();

  TextEditingController favController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastPref?.setString('lastScreen', '/NavigationScreen_4');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ScrollablePositionedList.builder(
              initialScrollIndex: favIndex,
              itemCount: imagesController.fireSafty.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        index < imagesController.fireSafty.length - 1
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  child: Image.asset(imagesController.fireSafty[index]),
                                ),
                              )
                            : imagesController.linkWidget(),
                        index < imagesController.fireSafty.length - 1
                            ? Positioned(
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
                                                                      pref?.setInt('FireSafty_${favController.text}', index);
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
                              )
                            : Text(''),
                      ],
                    ),
                    (index + 1) % 4 == 0 && index != 0
                        ?  SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: AdWidget(
                    ad: BannerAd(
                      
                      adUnitId: "ca-app-pub-3940256099942544/6300978111",
                      size: AdSize.largeBanner,
                      request: AdRequest(),
                      listener: BannerAdListener(
                        onAdLoaded: (Ad ad) =>print("Ad loaded"),
                        onAdFailedToLoad: (Ad ad, LoadAdError error){
                          ad.dispose();
                          print("Ad failed to load: $error");
                        },
                        onAdOpened: (Ad ad)=>print("Ad opened"),
                        onAdClosed: (Ad ad)=>print("Ad closed"),
                      ),
                    )..load(),
                  ),
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
