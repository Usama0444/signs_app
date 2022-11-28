import 'dart:io';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? image;

  takeScreenshotAndShare() async {
    await screenshotController.capture(delay: const Duration(milliseconds: 10), pixelRatio: 2.0).then((img) {
      setState(() {
        image = img!;
      });
    });
    final dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/screen.png');
    file.writeAsBytes(image!);
    Share.file('esys image', 'esys.png', image!, 'image/png', text: 'My optional text.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screenshot(
        controller: screenshotController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ElevatedButton(
              onPressed: () {
                takeScreenshotAndShare();
              },
              child: const Text('Take Screenshot'),
            )),
          ],
        ),
      ),
    );
  }
}
