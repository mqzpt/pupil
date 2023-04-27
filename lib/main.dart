import 'dart:io';
// import 'titlepage.dart';
import 'package:flutter/material.dart';
import 'package:pupil/utils/utils.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

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
      floatingActionButton: SizedBox(
        width: 330.0,
        height: 86.0,
        child: ElevatedButton(
          onPressed: () {
            pickImage(ImageSource.gallery, pickedImage);
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(225, 255, 227, 185),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Container(
            child: Center(
              child: Text(
                'Pick Image',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(children: [
          if (_pickedImage == null)
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                width: 330,
                height: 490.0,
                decoration: BoxDecoration(
                  color: Color(0xE3E3E3FF),
                  image: DecorationImage(
                    image: AssetImage("assets/icon/icon.png"),
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeat,
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(47.0)),
                ),
              ),
            )
          else
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.file(
                _pickedImage!,
                fit: BoxFit.fill,
              ),
            ),
          Expanded(child: Container()),
          Text(
            outputText,
            style: TextStyle(fontSize: 24),
          ),
          Expanded(child: Container()),
        ]),
      ),
    );
  }
}
