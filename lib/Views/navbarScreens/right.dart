import 'package:flutter/material.dart';

class Right extends StatefulWidget {
  const Right({super.key});

  @override
  State<Right> createState() => _RightState();
}

class _RightState extends State<Right> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Right"),
      ),
    );
  }
}