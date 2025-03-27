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
      title: 'Telegram',
      home: HomePage(),
      /*
      Ini rutenya nggak bisa, nanti kita perbaiki kalau sempat
      routes: {
        '/homepage': (context) => HomePage(),
        '/chatpage': (context) => ChatPage(chatData: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
      },
      */
    );
  }
}
