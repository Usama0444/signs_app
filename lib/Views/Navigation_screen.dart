import 'dart:io';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:signs_app/Views/Assembly_sign.dart';
import 'package:signs_app/Views/ButtonsScreen.dart';
import 'package:signs_app/Views/EmergencySigns.dart';
import 'package:signs_app/Views/FireAdSign.dart';
import 'package:signs_app/Views/cctv.dart';
import 'package:signs_app/Views/fire_safty.dart';
import 'package:signs_app/Views/foodpre.dart';
import 'package:signs_app/Views/no_Access.dart';
import 'package:signs_app/Views/smoking.dart';
import 'package:signs_app/Views/visitor_sign.dart';
import 'package:signs_app/Views/warning.dart';
import 'package:signs_app/main.dart';

class NavigationScreen extends StatefulWidget {
  int index;
  NavigationScreen({super.key, required this.index});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int currentIndex;
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? image;

  static const int maxFailedLoadAttempts = 5;
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  List<Widget> widgetList = [
    EmergencySigns(),
    const AssemblySign(),
    const FireAd(),
    const Visitor(),
    const FireSafty(),
    const Smoking(),
    const NoAccess(),
    const Warning(),
    const FoodPre(),
    const CCTV(),
  ];

  void getScreen(int index) {
    if (index == 0) {
      SystemNavigator.pop();
      favIndex = 0;
    } else if (index == 1) {
      if (currentIndex > 0) {
        currentIndex--;
        favIndex = 0;
      }
    } else if (index == 2) {
      Get.to(const ButtonScreen());
      favIndex = 0;
    } else if (index == 3) {
      if (currentIndex < widgetList.length - 1) {
        currentIndex++;
        favIndex = 0;
      }
    } else if (index == 4) {
      takeScreenshotAndShare();
    }
    setState(() {});
  }

  takeScreenshotAndShare() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((img) {
      setState(() {
        image = img;
      });
    });

    final dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/screen.png');
    file.writeAsBytes(image!);
    await Share.file('esys image', 'esys.png', image!, 'image/png',
        text:
            'https://play.google.com/store/apps/details?id=com.signApp.android&hl=en&gl=US');
  }

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
    currentIndexInit();
    lastPref?.setString('lastScreen', '/NavigationScreen');
  }

  currentIndexInit() {
    currentIndex = widget.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        body: widgetList[currentIndex],
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _showInterstitialAd();
                  getScreen(0);
                },
                child: SvgPicture.asset(
                  "assets/exit.svg",
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  _showInterstitialAd();
                  getScreen(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/left.svg",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const Text("Prev")
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    _showInterstitialAd();
                    getScreen(2);
                  },
                  child: SvgPicture.asset(
                    "assets/index.svg",
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  )),
              InkWell(
                onTap: () {
                  _showInterstitialAd();
                  getScreen(3);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/right.svg",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const Text("Next")
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _showInterstitialAd();
                  getScreen(4);
                },
                child: SvgPicture.asset(
                  "assets/share.svg",
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712 ",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}
