import 'package:flutter/material.dart';
import 'package:telegram/home_page.dart';

void main() {
  runApp(Telegram());
}

class Telegram extends StatelessWidget {
  const Telegram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
      routes: {
        '/home': (context) => HomePages(),
      },
    );
  }
}