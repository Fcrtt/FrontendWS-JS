import 'package:flutter/material.dart';
import 'package:dashboard/pages/intro_page.dart';
import 'package:dashboard/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
       '/homepage': (context) => HomePage(),
        '/intropage': (context) => IntroPage()
      },
    );
  }
}
