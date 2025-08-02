import 'package:flutter/material.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height:height/1.1,
        color: Color(0xff3D5A80),
        child: Row(
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
                          text: "Create your website in",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: " less then 12 Days",
                          style: TextStyle(color: Color(0xffEE6C4D)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 600,
                  child: Text(
                    "Hey, I’m Mark Essein. A fullstack web developer with 7 years experience building successful websites and applications. I can build a high converting website for you as quick as possible!",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEE6C4D),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Get in touch", style: TextStyle(fontSize: 25)),
                ),
              ],
            ),
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
                   child: Image.asset("assets/images/hero_image.png",scale: 6,)),
             ],
           )
          ],
        ),
      ),
    );
  }
}
