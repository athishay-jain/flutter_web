import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNavigator extends StatefulWidget {
  final void Function(String selection) onSelected;

  TopNavigator({super.key, required this.onSelected});

  @override
  State<TopNavigator> createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  int isHover = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final width = MediaQuery.of(context).size.width;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          //  color: Color(0x7b3d5a80),
          height: isMobile?60: 80,
          width: double.infinity,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: isMobile
                ? Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 25),
                        child: Text(
                          "Athishay.dev",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 30),
                        child: IconButton(icon: Icon(Icons.menu,color: Colors.white,size: 30,),onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },),

                      ),
                    ],
                  )
                : Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 25),
                        child: Text(
                          "Athishay.dev",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          widget.onSelected("home");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MouseRegion(
                            onEnter: (_) {
                              isHover = 1;
                              setState(() {});
                            },
                            onExit: (_) {
                              isHover = 0;
                              setState(() {});
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                AnimatedContainer(
                                  width: isHover == 1 ? 49 : 0,
                                  height: 4,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEE6C4D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onSelected("about");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MouseRegion(
                            onEnter: (_) {
                              isHover = 2;
                              setState(() {});
                            },
                            onExit: (_) {
                              isHover = 0;
                              setState(() {});
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "About Me",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                AnimatedContainer(
                                  width: isHover == 2 ? 75 : 0,
                                  height: 4,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEE6C4D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onSelected("work");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MouseRegion(
                            onEnter: (_) {
                              isHover = 3;
                              setState(() {});
                            },
                            onExit: (_) {
                              isHover = 0;
                              setState(() {});
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Works",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                AnimatedContainer(
                                  width: isHover == 3 ? 50 : 0,
                                  height: 4,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEE6C4D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onSelected("contact");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MouseRegion(
                            onEnter: (_) {
                              isHover = 4;
                              setState(() {});
                            },
                            onExit: (_) {
                              isHover = 0;
                              setState(() {});
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Contact",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                AnimatedContainer(
                                  width: isHover == 4 ? 62 : 0,
                                  height: 4,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEE6C4D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL(
                              "https://docs.google.com/document/d/1ODBQcc24UUeCRFQPVDmDX_uDPPk1UvOG/edit?usp=sharing&ouid=103964338836377224892&rtpof=true&sd=true",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                            backgroundColor: Color(0xffEE6C4D),
                          ),
                          child: Text(
                            "Download CV",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
