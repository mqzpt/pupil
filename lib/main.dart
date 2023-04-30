import 'dart:io';
// import 'titlepage.dart';
import 'titlepage.dart';
import 'palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pupil/utils/utils.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

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
      title: 'pupil',
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
      home: ImageToText(),
    );
  }
}

class ImageToText extends StatefulWidget {
  const ImageToText({Key? key}) : super(key: key);

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  File? _pickedImage;
  String outputText = "";

  pickedImage(File file) {
    setState(() {
      _pickedImage = file;
    });

    InputImage inputImage = InputImage.fromFile(file);
    //code to recognize image
    processImageForConversion(inputImage);
  }

  processImageForConversion(inputImage) async {
    setState(() {
      outputText = "";
    });

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    for (TextBlock block in recognizedText.blocks) {
      setState(() {
        outputText += block.text + "\n";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 75, left: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ButtonNavigation(),
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
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
            ),
            if (_pickedImage == null)
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Color.fromARGB(226, 0, 0, 0),
                  borderRadius: BorderRadius.all(const Radius.circular(47.0)),
                ),
              )
            else
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(226, 0, 0, 0),
                  borderRadius: BorderRadius.all(const Radius.circular(47.0)),
                ),
                child: Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      outputText,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              child: SizedBox(
                width: 86.0,
                height: 86.0,
                child: ElevatedButton(
                  onPressed: () {
                    pickImage(ImageSource.gallery, pickedImage);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 195, 154, 108),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: 40.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
