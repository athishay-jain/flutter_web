import 'package:flutter/material.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      width: width,
       color:  Color(0xff2F3746),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Text("©2025 Athishay.dev - All rights reserved",style: TextStyle(fontSize: 16,color: Colors.white),),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Connect with me:",style: TextStyle(fontSize: 16,color: Colors.white),),
              SizedBox(width: 10,),
              Image.asset("assets/images/icons/github.png",scale: 18,),
              SizedBox(width: 10,),
              Image.asset("assets/images/icons/linkedin.png",scale: 18,),
            ],
          )
      ],
    ),
    );
  }
}
