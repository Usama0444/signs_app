import 'dart:io';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
    lastScreen();
  }

  lastScreen() async {
    await lastPref?.setString('lastScreen', '/ButtonScreen');
    await Future.delayed(const Duration(seconds: 1));
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

  launchURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static const int maxFailedLoadAttempts = 5;
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

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
            body: SizedBox(
              child: ListView.builder(
                  itemCount: btn.length + 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        index <= btn.length - 1
                            ? InkWell(
                                onTap: () {
                                  _showInterstitialAd();
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
                                  GestureDetector(
                                      onTap: () {
                                        launchURL('https://sherazz.blogspot.com/');
                                      },
                                      child: Image.asset('assets/blog.png')),
                                  GestureDetector(
                                      onTap: () {
                                        launchURL('https://www.youtube.com/@WrongBrothersRestoration');
                                      },
                                      child: Image.asset('assets/channel.png')),
                                  GestureDetector(
                                      onTap: () {
                                        launchURL('https://play.google.com/store/apps/details?id=com.starmakerinteractive.starmaker&hl=en');
                                      },
                                      child: Image.asset('assets/rate.png')),
                                ],
                              ),
                        (index + 1) % 4 == 0 && index != 0
                            ? SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: AdWidget(
                                  ad: BannerAd(
                                    adUnitId: "ca-app-pub-3940256099942544/6300978111",
                                    size: AdSize.largeBanner,
                                    request: AdRequest(),
                                    listener: BannerAdListener(
                                      onAdLoaded: (Ad ad) => print("Ad loaded"),
                                      onAdFailedToLoad: (Ad ad, LoadAdError error) {
                                        ad.dispose();
                                        print("Ad failed to load: $error");
                                      },
                                      onAdOpened: (Ad ad) => print("Ad opened"),
                                      onAdClosed: (Ad ad) => print("Ad closed"),
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
            )),
      ),
    );
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
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
      onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
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
