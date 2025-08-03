import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WorksScreen extends StatefulWidget {
  const WorksScreen({super.key});

  @override
  State<WorksScreen> createState() => _WorksScreenState();
}

class _WorksScreenState extends State<WorksScreen> {
  int hoverIndex = -1;
  int hoverIcon = 0;
  int iconNum=0;
 bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      color: Color(0xff293241),
      // height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height / 15),
          Padding(
            padding: EdgeInsets.only(left: width / 10),
            child: Text(
              "My Recent Apps",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: width / 10),
            child: Container(
              height: 3,
              width: 210,
              decoration: BoxDecoration(
                color: Color(0xffEE6C4D),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: height / 15),
          AnimationLimiter(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: width / 9),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: width / 18,
                mainAxisSpacing: width / 25,
              ),
              itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(delay:500.ms,position: index, columnCount: 3, child: ScaleAnimation(child: FadeInAnimation(duration:Duration(milliseconds: 500),child: LayoutBuilder(
                builder: (context, constraints) {
                  final cardHeight = constraints.maxHeight;
                  final cardWidth = constraints.maxWidth;
                  print(
                    "the size at full of card height :$cardHeight,card Width :$cardWidth",
                  );
                  return MouseRegion(
                    onEnter: (_) {
                      hoverIndex = index;
                      setState(() {});
                    },
                    onExit: (_) {
                      hoverIndex = -1;
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        color: Color(0xff2F3746),
                        border: index == hoverIndex
                            ? Border.all(color: Color(0xffEE6C4D), width: 1)
                            : null,
                        boxShadow: index == hoverIndex
                            ? [
                          BoxShadow(
                            color: Color(0xb2ee6c4d),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ]
                            : [
                          BoxShadow(
                            color: Colors.black.withAlpha(50),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: cardHeight / 2.5,
                            width: cardWidth,
                            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://media.licdn.com/dms/image/v2/D4E22AQHhTD5Isd6Inw/feedshare-shrink_2048_1536/B4EZhMdYjiGwAo-/0/1753629429404?e=1756944000&v=beta&t=x4VyHe0-b07ODE2JNBkrxSMr4Vu8On_TX-Uk8y1NybE",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: cardHeight / 20),
                          Padding(
                            padding: EdgeInsets.only(left: cardWidth / 15),
                            child: Text(
                              "Project Name",
                              style: TextStyle(
                                fontSize: cardWidth / 17.04,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: cardHeight / 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: cardWidth / 15,
                            ),
                            child: Text(
                              "Built My Own Weather App – SkyCast⛅Excited to share a clean, minimal and feature-rich weather app built using Flutter + OpenWeather APIs! and used flutter for frontend",
                              style: TextStyle(
                                fontSize: cardWidth / 26.625,
                                color: Colors.white,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: cardHeight / 50),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: cardWidth / 15,
                            ),
                            child: Text(
                              "Links",
                              style: TextStyle(
                                fontSize: cardWidth / 26.625,
                                color: Color(0xffEE6C4D),
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: cardWidth / 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: cardWidth / 15),
                              MouseRegion(
                                onEnter: (_) {
                                  hoverIcon = index;
                                  iconNum=1;
                                  setState(() {});
                                },
                                onExit: (_) {
                                  hoverIcon = -1;
                                  iconNum=0;
                                  setState(() {});
                                },
                                child: AnimatedScale(
                                  duration: Duration(milliseconds: 300),
                                  scale: hoverIcon == index ?iconNum==1? 1.4 : 1:1,
                                  child: Image.asset(
                                    "assets/images/icons/github.png",
                                    height: cardWidth/12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: cardWidth / 18),
                              MouseRegion(
                                onEnter: (_) {
                                  hoverIcon = index;
                                  iconNum=2;
                                  setState(() {});
                                },
                                onExit: (_) {
                                  hoverIcon = -1;
                                  iconNum=0;
                                  setState(() {});
                                },
                                child: AnimatedScale(
                                  duration: Duration(milliseconds: 300),
                                  scale: hoverIcon == index ?iconNum==2? 1.4 : 1:1,
                                  child: Image.asset(
                                    "assets/images/icons/linkedin.png",
                                    height: cardWidth/13,
                                  ),
                                ),
                              ),
                              SizedBox(width: cardWidth / 15),
                              MouseRegion(
                                onEnter: (_) {
                                  hoverIcon = index;
                                  iconNum=3;
                                  setState(() {});
                                },
                                onExit: (_) {
                                  hoverIcon = -1;
                                  iconNum=0;
                                  setState(() {});
                                },
                                child: AnimatedScale(
                                  duration: Duration(milliseconds: 300),
                                  scale: hoverIcon == index ? iconNum==3?1.4 : 1:1,
                                  child: Image.asset(
                                    "assets/images/icons/logo.png",
                                    height: cardWidth/13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),)))
            ),
          ),
          SizedBox(height: height / 15),
          Center(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xffEE6C4D)),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Show More",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xffEE6C4D),
                ),
              ),
            ),
          ),
          SizedBox(height: width/25,)
        ],
      ),
    );
  }
}
