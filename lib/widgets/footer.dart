import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      height: 120,
      width: width,
      color: Color(0xff2F3746),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: isMobile
            ?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Padding(
            padding: EdgeInsets.only(left: width / 25),
            child: Text(
              "Athishay.dev",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),*/
            Text(
              "©2025 Athishay.dev - Built with Flutter",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Connect with me:",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    _launchURL("https://github.com/athishay-jain");
                  },
                  child: Image.asset(
                    "assets/images/icons/github.png",
                    scale: 18,
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    _launchURL(
                      "https://www.linkedin.com/in/athishay-jain",
                    );
                  },
                  child: Image.asset(
                    "assets/images/icons/linkedin.png",
                    scale: 18,
                  ),
                ),
              ],
            ),
          ],
        ): Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*Padding(
            padding: EdgeInsets.only(left: width / 25),
            child: Text(
              "Athishay.dev",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),*/
                  SelectableText(
                    "©2025 Athishay.dev - Built with Flutter",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Connect with me:",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          _launchURL("https://github.com/athishay-jain");
                        },
                        child: Image.asset(
                          "assets/images/icons/github.png",
                          scale: 18,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          _launchURL(
                            "https://www.linkedin.com/in/athishay-jain",
                          );
                        },
                        child: Image.asset(
                          "assets/images/icons/linkedin.png",
                          scale: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ,
      ),
    );
  }
}
