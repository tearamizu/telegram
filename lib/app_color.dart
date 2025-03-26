import 'package:flutter/material.dart';

class AppColor {
  final invisible = Colors.transparent;
  final white = Color.fromARGB(255, 255, 255, 255);
  final black = Colors.black;
  final grey = Colors.grey;
  final lightGray = Colors.grey[300];
  final green = Color.fromARGB(255, 78, 204, 93);
  final myBubbleChat = Color.fromARGB(255, 232, 247, 253);
  final readedIndicator = Color.fromARGB(255, 45, 157, 201);
  final primary = const Color.fromARGB(255, 83, 124, 163);

  final linearGradientBlue = const LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color.fromARGB(255, 128, 219, 247), Color.fromARGB(255, 196, 232, 255)],
    stops: [0.0, 1.0]
  );

  /*
  final Shader shader = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0Xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  */
}