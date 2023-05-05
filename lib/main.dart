import 'package:pupil/language.dart';
import 'palette.dart';
import 'package:flutter/services.dart';
import 'package:pupil/image_picker.dart';
import 'package:pupil/nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.lightBlue,
          /* light theme settings */
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: PaletteIndigo.indigo,
          /* dark theme settings */
        ),
        themeMode: ThemeMode.system,
        /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
        debugShowCheckedModeBanner: false,
        title: 'pupil',
        home: ButtonNavigation());
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
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 0, 0, 0), size: 32),
        toolbarHeight: 90,
        leadingWidth: 90,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25, top: 85),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Image to Text Translator',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontFamily: 'Garamond',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'AI Camera App',
                            style: TextStyle(
                              fontSize: 20.0,
                              height: 2,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            "Instantly translate text from images with our AI-powered app. Perfect for learning, discovery, and navigation.",
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 2,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ], // End of text column
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 86.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const ImageToText(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return SlideTransition(
                                        textDirection: TextDirection.ltr,
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        transformHitTests: true,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
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
                          const SizedBox(
                              height:
                                  30.0), // Add some spacing between the buttons
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 83.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const ChooseLanguage(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return SlideTransition(
                                        textDirection: TextDirection.ltr,
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        transformHitTests: true,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 195, 154, 108),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Choose Language',
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
                              // End of second button
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ], // End of children container
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
