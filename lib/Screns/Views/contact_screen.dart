import 'package:flutter/material.dart';
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      ///height: height,
      width: double.infinity,
      color: Color(0xff3D5A80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: width/30,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: width / 10),
              child: Text(
                "Lets Connect",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
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
          ),
          SizedBox(height: width/40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width/3.5,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0x61000000),
                   filled: true,
                   labelText: "Name",
                   labelStyle: TextStyle(color: Color(0xb3ffffff)),
                   border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none,)
                  ),
                ),
              ),
              SizedBox(width: width/80,),
              SizedBox(
                width: width/3.5,
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color(0x61000000),
                      filled: true,
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xb3ffffff)),
                      border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none,)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: width/80,),
          SizedBox(
            width: width/1.71,
            child: TextField(
              maxLines: 6,
              decoration: InputDecoration(
                  fillColor: Color(0x61000000),
                  filled: true,
                  hintText: "Message",
               ///   labelText: "Message",
                  hintStyle: TextStyle(color: Color(0xb3ffffff)),
                  border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none,)
              ),
            ),
          ),
          SizedBox(height: width/25,)
        ],
      ),
    );
  }
}
