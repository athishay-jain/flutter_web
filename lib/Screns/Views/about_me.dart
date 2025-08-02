import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height/1.1,
      color: Color(0xff293241),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height / 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlutterLogo(size: 200),
              SizedBox(
                width: 600,
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
                      "My passion for building websites started since 2013 and since then i have helped companies around the world build amazing websites and products that create real value for the business and users. \n \nI enjoy solving problems with clean scalable solutions and I also have a genuine passion for inspiring design.\n \nI am a fullstack developer focusing on core frontend and backend technologies which include HTML, CSS, Javascript, React and other core languages",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: height / 2.9,
            color: Color(0xff2F3746),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Projects i have been worked",
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
