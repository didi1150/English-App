import 'package:eng_app_v2/components/mainScaffold.dart';
import 'package:eng_app_v2/pages/homePage.dart';
import 'package:eng_app_v2/pages/setupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EngApp());
}

class EngApp extends StatelessWidget {
  const EngApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const MyScaffold(),
      routes: {
        "/sell" : (context) => const SellProduct(),
        "/home" : (context) => HomePage(),
      },
    );
  }
}