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
          title: Text('SideBar'),
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          shadowColor: Color.fromARGB(0, 255, 255, 255),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 330.0,
            height: 86.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(225, 255, 227, 185),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
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
          SizedBox(height: 16.0), // Add some spacing between the buttons
          SizedBox(
            width: 330.0,
            height: 86.0,
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
