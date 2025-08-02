import 'package:flutter/material.dart';
import 'package:flutter_web/Screns/Views/about_me.dart';
import 'package:flutter_web/Screns/Views/contact_screen.dart';
import 'package:flutter_web/Screns/Views/hero_screen.dart';
import 'package:flutter_web/Screns/Views/works_screen.dart';
import 'package:flutter_web/widgets/footer.dart';
import 'package:flutter_web/widgets/top_navigator.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class LandingScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey workKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  LandingScreen({super.key});

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final offset = box.localToGlobal(Offset.zero).dy + scrollController.offset;

      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                WebSmoothScroll(
                  controller: scrollController,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeroScreen(key: homeKey),
                        AboutMe(key: aboutKey),
                        WorksScreen(key: workKey),
                        ContactScreen(key: contactKey),
                        const Footer(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TopNavigator(
                    onSelected: (selection) {
                      if (selection == "home") {
                        scrollToSection(homeKey);
                      } else if (selection == "about") {
                        scrollToSection(aboutKey);
                      } else if (selection == "work") {
                        scrollToSection(workKey);
                      } else if (selection == "contact") {
                        scrollToSection(contactKey);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
