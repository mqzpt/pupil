import 'package:flutter/material.dart';
import 'main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:share_plus/share_plus.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  children: [],
                )),
            Container(
              padding: const EdgeInsets.only(top: 25),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "What's your first name?"),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "And your last name?"),
                  ),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                  ),
                  const DropDownTextField(
                    dropDownList: [
                      DropDownValueModel(name: 'Woman', value: '1'),
                      DropDownValueModel(name: 'Man', value: '2'),
                      DropDownValueModel(
                          name: 'Prefer not to specify', value: '3'),
                    ],
                    textFieldDecoration:
                        InputDecoration(hintText: 'Select your gender'),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "What is your date of birth?"),
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
