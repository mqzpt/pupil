import 'main.dart';
import 'palette.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

String languageSelect = '🇰🇷';
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
      home: const ChooseLanguage(),
    );
  }
}

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  List<Map<String, dynamic>> LanguageList = [
    {'language': 'English', 'flag': '🇬🇧'},
    {'language': 'French', 'flag': '🇫🇷'},
    {'language': 'Spanish', 'flag': '🇪🇸'},
    {'language': 'Korean', 'flag': '🇰🇷'},
    {'language': 'Cantonese', 'flag': '🇭🇰'},
    {'language': 'Arabic', 'flag': '🇸🇦'},
    {'language': 'Lithuanian', 'flag': '🇱🇹'},
    {'language': 'Russian', 'flag': '🇷🇺'},
    {'language': 'Japanese', 'flag': '🇯🇵'},
    {'language': 'Mandarin', 'flag': '🇨🇳'},
    {'language': 'Sinhala', 'flag': '🇱🇰'},
    {'language': 'Italian', 'flag': '🇮🇹'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 75, left: 33),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 60.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const ButtonNavigation(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            textDirection: TextDirection.rtl,
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Selected Language',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              languageSelect,
                              style: const TextStyle(fontSize: 40.0),
                            ),
                          ]),
                    )
                  ],
                ))
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(
            top: 260,
          ),
          child: ListView.builder(
            itemCount: LanguageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        languageSelect =
                            LanguageList[index]['flag']; // handle button press
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          LanguageList[index]['language'],
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(LanguageList[index]['flag'],
                            style: const TextStyle(fontSize: 50)),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
