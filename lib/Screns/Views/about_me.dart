import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutMe extends StatefulWidget {
  AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  List<String> images = [
    "assets/images/logos/flutter_logo.png",
    "assets/images/logos/dart_logo.png",
    "assets/images/logos/Firebase_logo.jpg",
    "assets/images/logos/github_logo.png",
    "assets/images/logos/sqlite_logo.png",
    "assets/images/logos/bloc_logo.png",
  ];

int hoverIndex=-1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      //  height: height/1.1,
      color: Color(0xff293241),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: width / 25),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 600),
            switchOutCurve: Curves.easeInOut,
            switchInCurve: Curves.easeInOut,
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg/undraw_feeling-proud_tdos.svg",
                        height: width / 2,
                      ),
                      SizedBox(
                        width: width / 1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "About Me",
                              style: TextStyle(
                                fontSize: width / 20,
                                color: Colors.white,
                              ),
                            ).animate().fadeIn(),
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
                            SelectableText(
                              "I’m Athishay Jain, a passionate Flutter developer who creates cross-platform apps for mobile, web, and desktop. I specialize in building high-performance, responsive, and visually appealing applications with clean architecture. My work includes UI/UX implementation, backend integration with Firebase and REST APIs, and solving complex problems with elegant solutions. I believe in writing clean, maintainable code and delivering apps that are both functional and delightful to use. Outside of coding, I explore new tech trends, work on side projects, and constantly improve my skills to stay ahead in the fast-moving world of technology.",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg/undraw_feeling-proud_tdos.svg",
                        height: width / 5.2,
                      ),
                      SizedBox(
                        width: 520,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "About Me",
                              style: TextStyle(
                                fontSize: 29,
                                color: Colors.white,
                              ),
                            ).animate().then(delay: 600.ms).fadeIn(curve: Curves.easeInOut),
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
                            SelectableText(
                              "I’m Athishay Jain, a passionate Flutter developer who creates cross-platform apps for mobile, web, and desktop. I specialize in building high-performance, responsive, and visually appealing applications with clean architecture. My work includes UI/UX implementation, backend integration with Firebase and REST APIs, and solving complex problems with elegant solutions. I believe in writing clean, maintainable code and delivering apps that are both functional and delightful to use. Outside of coding, I explore new tech trends, work on side projects, and constantly improve my skills to stay ahead in the fast-moving world of technology.",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ).animate()
                                .then(delay: 700.ms)
                                .fadeIn(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),

          //Spacer(),
          Container(
            width: double.infinity,
         //   height: height / 2.9,
            color: Color(0xff2F3746),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                SelectableText(
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
                SizedBox(height: 20),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: images.length,
                  padding: EdgeInsets.symmetric(horizontal: width/5),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: isMobile?150:200,
                    crossAxisSpacing: 50,
                    childAspectRatio: 4/3,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) => MouseRegion(
                    onEnter: (event) {
                      hoverIndex=index;
                      setState(() {

                      });
                    },
                    onExit: (event) {
                      hoverIndex=-1;
                      setState(() {

                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: index == hoverIndex
                            ? Border.all(color: Color(0xffEE6C4D), width: 1)
                            : null,
                        boxShadow: index == hoverIndex
                            ? [
                          BoxShadow(
                            color: Color(0xb2ee6c4d),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]
                            : [
                          BoxShadow(
                            color: Colors.black.withAlpha(50),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
