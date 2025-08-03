import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final isMobile = MediaQuery
        .of(context)
        .size
        .width < 800;
    return Container(
      //  height: height/1.1,
      color: Color(0xff293241),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: width / 25),
          AnimatedSwitcher(duration: Duration(milliseconds: 600),
            switchOutCurve: Curves.easeInOut,
            switchInCurve: Curves.easeInOut,
            child: isMobile ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/svg/undraw_feeling-proud_tdos.svg",
                  height: width / 2,),
                SizedBox(
                  width:width/1.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(fontSize: width/20, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Color(0xffEE6C4D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "I’m a passionate Flutter developer with experience building cross-platform mobile and web apps using Flutter & Dart.\n \n I enjoy solving problems with elegant UI/UX and have worked on projects ranging from weather apps to e-commerce solutions.",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/images/svg/undraw_feeling-proud_tdos.svg",
                  height: width / 5.2,),
                SizedBox(
                  width: 520,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(fontSize: 29, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Color(0xffEE6C4D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "I’m a passionate Flutter developer with experience building cross-platform mobile and web apps using Flutter & Dart.\n \n I enjoy solving problems with elegant UI/UX and have worked on projects ranging from weather apps to e-commerce solutions.",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),),

          //Spacer(),
          Container(
            width: double.infinity,
            height: height / 2.9,
            color: Color(0xff2F3746),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Skills / Tech Stack",
                  style: TextStyle(fontSize: 29, color: Colors.white),
                ),
                SizedBox(height: 10),
                Container(
                  width: 150,
                  height: 3.5,
                  decoration: BoxDecoration(
                    color: Color(0xffEE6C4D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Image.asset(
                        "assets/images/logos/expo.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Image.asset(
                        "assets/images/logos/quizein.jpg",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        "assets/images/logos/shopnest.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        "assets/images/logos/skycast.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        "assets/images/logos/wallz.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        "assets/images/logos/zentra.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
