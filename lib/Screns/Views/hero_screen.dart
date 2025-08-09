import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
class HeroScreen extends StatelessWidget {
  final void Function(String selection) onSelected;
   HeroScreen({super.key,required this.onSelected});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: isMobile ? height / 1.1 : height / 1.1,
        color: Color(0xff3D5A80),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: width / 4),
                    SizedBox(
                      width: width / 1.2,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: width / 13 > 40 ? 40 : width / 13,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "Create your apps in",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: " less then 12 Days",
                              style: TextStyle(color: Color(0xffEE6C4D)),
                            ),
                          ],
                        ),
                      ).animate().fadeIn().slide().scale().then(delay: 300.ms).shake(),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: width / 1.2,
                      child: SelectableText(
                        "Hey, I’m Athishay Jain. Passionate Flutter developer with a strong foundation in cross-platform mobile app development, UI/UX     design, and project execution. Built and deployed real-world apps with modern, responsive interfaces and backend integrations.",
                        style: TextStyle(
                          fontSize: width / 23 > 20 ? 20 : width / 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _launchURL(
                              "https://docs.google.com/document/d/1ODBQcc24UUeCRFQPVDmDX_uDPPk1UvOG/edit?usp=sharing&ouid=103964338836377224892&rtpof=true&sd=true",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffEE6C4D),
                            padding: EdgeInsets.symmetric(
                              vertical: width / 50,
                              horizontal: width / 30,
                            ),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Download CV",
                            style: TextStyle(
                              fontSize: width / 25 > 25 ? 20 : width / 25,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            onSelected("work");
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color(0xffEE6C4D),
                              width: 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: width / 50,
                              horizontal: width / 30,
                            ),
                            foregroundColor: Color(0xffEE6C4D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "View projects",
                            style: TextStyle(
                              fontSize: width / 25 > 25 ? 20 : width / 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            height: 350,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Color(0x5E293241),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "assets/images/hero_image.webp",
                            scale: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 480,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Create your apps in",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: " less then 12 Days",
                                  style: TextStyle(color: Color(0xffEE6C4D)),
                                ),
                              ],
                            ),
                          ).animate().fadeIn(curve: Curves.easeInOut),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 600,
                          child: SelectableText(
                            "Hey, I’m Athishay Jain. Passionate Flutter developer with a strong foundation in cross-platform mobile app development, UI/UX     design, and project execution. Built and deployed real-world apps with modern, responsive interfaces and backend integrations.",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ).animate().then(delay: 400.ms).fadeIn(curve: Curves.easeInOut),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _launchURL(
                                  "https://docs.google.com/document/d/1ODBQcc24UUeCRFQPVDmDX_uDPPk1UvOG/edit?usp=sharing&ouid=103964338836377224892&rtpof=true&sd=true",
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffEE6C4D),
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 60,
                                ),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Download CV",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            SizedBox(width: 20),
                            OutlinedButton(
                              onPressed: () {
                                onSelected("work");
                              },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 60,
                                ),
                                foregroundColor: Color(0xffEE6C4D),
                                side: BorderSide(
                                  color: Color(0xffEE6C4D),
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "View projects",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Positioned(
                          bottom: width / 7,
                          child: Container(
                            height: width / 4,
                            width: width / 4,
                            decoration: BoxDecoration(
                              color: Color(0x5E293241),
                              shape: BoxShape.circle,
                            ),
                          ).animate().fadeIn(curve: Curves.easeInOut,duration: Duration(milliseconds: 600)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "assets/images/hero_image.webp",
                            width: width / 4,
                          ).animate().slide(curve: Curves.easeInOut,end: Offset.zero,begin: Offset(0, 1),duration: Duration(milliseconds: 600)),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
