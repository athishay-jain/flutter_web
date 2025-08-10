import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WorksScreen extends StatefulWidget {
  const WorksScreen({super.key});

  @override
  State<WorksScreen> createState() => _WorksScreenState();
}

class _WorksScreenState extends State<WorksScreen> {
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
  List<Map<String,dynamic>>projects=[
    {
      "image":"assets/images/projects/expense_app_banner.jpeg",
      "title":"Expo",
      "desc":"Created a complete Expense Tracker App using Flutter and Firebase! Features include transaction filters, analytics with graphs, user authentication, profile settings, and expense limits. Upcoming additions: push notifications and PDF export. Built during WsCube Tech’s Flutter course",
      "git":"https://github.com/athishay-jain/Expense_app",
      "linkedin":"https://www.linkedin.com/posts/athishay-jain_flutter-firebase-mobiledevelopment-activity-7352314472167788544-UwP7?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAFC1nawBBBaUx_X5-kNGpma1Ah2GQe5Mzxc",
      "playstore":null,
    },{
      "image":"assets/images/projects/sky_cast_app_banner.jpeg",
      "title":"SkyCast",
      "desc":"🌤️ Built SkyCast, a sleek Flutter weather app using OpenWeather API! Features real-time updates, hourly/4-day forecasts, dynamic UI, smooth city search, and animations. Open-source, customizable, and powered by REST API for a minimal yet rich experience.",
      "git":"https://github.com/athishay-jain/weather_application",
      "linkedin":"https://www.linkedin.com/posts/athishay-jain_flutter-mobileapp-weatherapp-activity-7355254943697567745-QVW0?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAFC1nawBBBaUx_X5-kNGpma1Ah2GQe5Mzxc",
      "playstore":null,
    },
  ];
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
          SizedBox(height: MediaQuery.of(context).size.height>945?40:height / 15),
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
          SizedBox(height: MediaQuery.of(context).size.height>945?40:height / 15),
          AnimationLimiter(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: width / 9),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: projects.length,
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
                                image: AssetImage(
                                  projects[index]["image"],
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
                              projects[index]["title"],
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
                             projects[index]["desc"],
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
                              GestureDetector(
                                onTap: (){
                                  _launchURL(projects[index]['git']);
                                },
                                child: MouseRegion(
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
                              ),
                              SizedBox(width: cardWidth / 18),
                              GestureDetector(
                                onTap: (){
                                  _launchURL(projects[index]['linkedin']);
                                },
                                child: MouseRegion(
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
                              ),
                              SizedBox(width: cardWidth / 15),
                             Visibility(
                                 visible: projects[index]['playstore']!=null,
                                 child:  MouseRegion(
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
                             ))
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
          /*SizedBox(height: height / 15),
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
          ),*/
          SizedBox(height: width/25,)
        ],
      ),
    );
  }
}
