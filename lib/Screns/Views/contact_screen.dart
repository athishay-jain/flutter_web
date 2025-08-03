import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final messageController = TextEditingController();

  bool isLoading = false;

  void submitHtmlForm() {
    final form = html.FormElement()
      ..action = 'https://formspree.io/f/manbddyk'
      ..method = 'POST'
      ..style.display = 'none';

    final nameInput = html.InputElement()
      ..name = 'name'
      ..value = nameController.text;

    final emailInput = html.InputElement()
      ..name = 'email'
      ..value = emailController.text;

    final messageInput = html.TextAreaElement()
      ..name = 'message'
      ..value = messageController.text;

    form.children.addAll([nameInput, emailInput, messageInput]);

    html.document.body!.append(form);
    form.submit();
    form.remove();
  }

  Future<void> submitForm() async {
    final url = Uri.parse('https://formspree.io/f/manbddyk');
    setState(() {
      isLoading = true;
    });

    /*try {*/
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        //  'Accept': 'application/json',
        },
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "message": messageController.text,
        },
      );
      /*final uri = Uri.parse('https://formspree.io/f/manbddyk');

      var request = http.MultipartRequest('POST', uri)
        ..fields['email'] = emailController.text
        ..fields['message'] = messageController.text
        ..fields['name'] = nameController.text;

      var response = await request.send();*/
      print(
        "the response is ${response.statusCode} and body is${response.body}",
      );
      if (response.statusCode == 200) {
        setState(() {
          OverlayEntry overlayEntry = OverlayEntry(
            builder: (context) => Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 2 - 150,
              child: Material(
                elevation: 4,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Message sent successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );

          Overlay.of(context).insert(overlayEntry);
          Future.delayed(Duration(seconds: 3), () {
            overlayEntry.remove();
          });
        });
        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        setState(() {
          OverlayEntry overlayEntry = OverlayEntry(
            builder: (context) => Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 2 - 150,
              child: Material(
                color: Colors.transparent,
                elevation: 4,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Failed to send message. Try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );

          Overlay.of(context).insert(overlayEntry);
          Future.delayed(Duration(seconds: 3), () {
            overlayEntry.remove();
          });
        });
      }
    /*} catch (e) {
      setState(() {
        OverlayEntry overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 2 - 150,
            child: Material(
              color: Colors.transparent,
              elevation: 4,
              child: Container(
                width: 300,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Error occurred: $e',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );

        Overlay.of(context).insert(overlayEntry);
        Future.delayed(Duration(seconds: 3), () {
          overlayEntry.remove();
        });
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Container(
        ///height: height,
        width: double.infinity,
        color: Color(0xff3D5A80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: width / 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: width / 10),
                child: Text(
                  "Let's Connect",
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
            SizedBox(height: width / 40),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              switchOutCurve: Curves.easeInOut,
              switchInCurve: Curves.easeInOut,
              child: isMobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width / 1.29,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name is required";
                              }
                              return null;
                            },
                            style: TextStyle(color: Color(0xb3ffffff)),
                            controller: nameController,
                            decoration: InputDecoration(
                              fillColor: Color(0x61000000),
                              filled: true,
                              labelText: "Name",
                              labelStyle: TextStyle(color: Color(0xb3ffffff)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: width / 80),
                        SizedBox(
                          width: width / 1.29,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                            style: TextStyle(color: Color(0xb3ffffff)),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              fillColor: Color(0x61000000),
                              filled: true,
                              labelText: "Email",
                              labelStyle: TextStyle(color: Color(0xb3ffffff)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width / 3.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name is Required";
                              }
                              return null;
                            },
                            style: TextStyle(color: Color(0xb3ffffff)),
                            controller: nameController,
                            decoration: InputDecoration(
                              fillColor: Color(0x61000000),
                              filled: true,
                              labelText: "Name",
                              labelStyle: TextStyle(color: Color(0xb3ffffff)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 80),
                        SizedBox(
                          width: width / 3.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                            controller: emailController,
                            style: TextStyle(color: Color(0xb3ffffff)),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Color(0x61000000),
                              filled: true,
                              labelText: "Email",
                              labelStyle: TextStyle(color: Color(0xb3ffffff)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: width / 80),
            SizedBox(
              width: isMobile ? width / 1.29 : width / 1.71,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Message is Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                maxLines: 6,
                controller: messageController,
                style: TextStyle(color: Color(0xb3ffffff)),
                decoration: InputDecoration(
                  fillColor: Color(0x61000000),
                  filled: true,
                  hintText: "Message",

                  ///   labelText: "Message",
                  hintStyle: TextStyle(color: Color(0xb3ffffff)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: width / 25),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {

                  submitHtmlForm();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffEE6C4D),
                foregroundColor: Colors.white,
                fixedSize: Size(220, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              child: Text(
                "Send Message",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: width / 25),
          ],
        ),
      ),
    );
  }
}
