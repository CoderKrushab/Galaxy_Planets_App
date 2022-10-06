import 'dart:async';

import 'package:flutter/material.dart';

import 'Screen/galaxypage.dart';
import 'Screen/planetpage.dart';
import 'Screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const splash(),
        "galaxy_planet": (context) => const galaxypage(),
        "planet_page": (context) => const planet(),
      },
    );
  }
}

