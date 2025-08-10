import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/Screns/landing_screen.dart';

void main() {
  debugRepaintRainbowEnabled =true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //scrollBehavior: SmoothScrollBehavior(),
      title: "Athishay Jain - Portfolio Website",
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     debugShowCheckedModeBanner: false,
      home:LandingScreen(),
    );
  }
}
class SmoothScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
