import 'main.dart';
import 'palette.dart';
import 'package:flutter/services.dart';
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
  final items = [
    'American',
    'Canadian',
    'Korean',
    'Cantonese',
    'Arabic',
    'Mandarin',
    'Lithuanian',
    'Spanish',
    'French',
    'Sinhala',
    'Russian'
  ];

  final flags = {
    'American': ['🇺🇸'],
    'Canadian': ['🇨🇦'],
    'Korean': ['🇰🇷'],
    'Cantonese': ['🇭🇰'],
    'Arabic': ['🇸🇦'],
    'Mandarin': ['🇨🇳'],
    'Lithuanian': ['🇱🇹'],
    'Spanish': ['🇪🇸'],
    'French': ['🇫🇷'],
    'Sinhala': ['🇱🇰'],
    'Russian': ['🇷🇺'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 75, left: 33),
        child: Align(
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
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 130,
        ),
        child: ListWheelScrollView(
          itemExtent: 150, // height of each item
          children: items.asMap().entries.map((MapEntry<int, String> entry) {
            final index = entry.key;
            final item = entry.value;
            final flags = this.flags[item];

            return Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // handle button press
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
                        item,
                        style: const TextStyle(
                          fontFamily: 'Times New Roman ',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (flags != null && flags.isNotEmpty)
                        Row(
                          children: flags
                              .map((flag) => Text(
                                    flag,
                                    style: TextStyle(fontSize: 50),
                                  ))
                              .toList(),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
