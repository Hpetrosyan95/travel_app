import 'package:flutter/material.dart';

import 'pages/details_page.dart';
import 'pages/flutter_welcome_page.dart';
import 'pages/navpages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyWelcomePage(),
        '/home': (context) => const MainPage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
