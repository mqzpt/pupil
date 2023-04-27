import 'dart:io';
import 'package:pupil/NavBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pupil',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: ButtonNavigation(),
    );
  }
}

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          shadowColor: Color.fromARGB(0, 255, 255, 255),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 270,
            height: 400,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Image to Text Translator',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Garamond',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'AI Camera App',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "Instantly translate text from images with our AI-powered app. Perfect for translating foreign notes, transcribing documents, and capturing text from signs and monuments.",
                    style: TextStyle(
                      fontSize: 18.0,
                      height: 1.5,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            width: 330.0,
            height: 86.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(224, 104, 164, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // Will update; use 'const' literals as arguments to constructors of '@immutable' classes.
                      'Start Translating',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0), // Add some spacing between the buttons
          SizedBox(
            width: 330.0,
            height: 83.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(223, 255, 219, 152),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pick a New Language',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(children: [
          Expanded(child: Container()),
        ]),
      ),
    );
  }
}
