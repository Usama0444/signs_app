import 'package:flutter/material.dart';

class Left extends StatefulWidget {
  const Left({super.key});

  @override
  State<Left> createState() => _LeftState();
}

class _LeftState extends State<Left> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Left"),
      ),
    );
  }
}