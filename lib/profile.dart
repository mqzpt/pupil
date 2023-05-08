import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'main.dart';
import 'language.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';

// import 'package:share_plus/share_plus.dart';
String modelSelect = "Latin";
String model = "Latin";

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 75, left: 33),
        child: Column(
          children: [
            Row(
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
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const ButtonNavigation(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                textDirection: ui.TextDirection.rtl,
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
                const Text(
                  'Bio-data',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                ),
                const Text('              '),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: const Color.fromARGB(255, 209, 197, 255),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/avatar/image.jpg'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Text(name,
                      style: const TextStyle(
                        fontFamily: 'DM Sans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                  Text(
                    email,
                    style: const TextStyle(
                        fontFamily: 'DM Sans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(100, 255, 255, 255),
                        fontSize: 17,
                        height: 2),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.57,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: _controller1,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "What's your full name?"),
                  ),
                  TextField(
                    controller: _controller2,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "What's your email?"),
                  ),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                  ),
                  DropDownTextField(
                    dropDownList: const [
                      DropDownValueModel(name: 'Latin', value: 'Latin'),
                      DropDownValueModel(name: 'Korean', value: 'Korean'),
                      DropDownValueModel(name: 'Japanese', value: 'Japanese'),
                      DropDownValueModel(name: 'Chinese', value: 'Chinese'),
                    ],
                    onChanged: (value) {
                      final selectedValue = value as DropDownValueModel;
                      model = selectedValue.name;
                    },
                    textFieldDecoration: const InputDecoration(
                        hintText:
                            'What language category do you translate text from?'),
                  ),
                  TextField(
                      controller: _controller4,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today_rounded),
                          labelText: "Select Date"),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          setState(() {
                            _date.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      }),
                  const SizedBox(height: 0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        name = _controller1.text;
                        email = _controller2.text;
                        modelSelect = model;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: const Center(
                        child: Text(
                          // Will update; use 'const' literals as arguments to constructors of '@immutable' classes.
                          'Update Profile',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
