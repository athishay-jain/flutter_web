import 'package:flutter/material.dart';
import 'package:flutter_web/Screns/Views/about_me.dart';
import 'package:flutter_web/Screns/Views/contact_screen.dart';
import 'package:flutter_web/Screns/Views/hero_screen.dart';
import 'package:flutter_web/Screns/Views/works_screen.dart';
import 'package:flutter_web/widgets/footer.dart';
import 'package:flutter_web/widgets/top_navigator.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeroScreen(),
                      AboutMe(),
                      WorksScreen(),
                      ContactScreen(),
                      Footer(),
                    ],
                  ),
                ),
                Align(alignment: Alignment.topCenter, child: TopNavigator()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
