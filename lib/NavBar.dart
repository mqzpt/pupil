import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      UserAccountsDrawerHeader(
          accountName: Text('Oflutter.com'),
          accountEmail: Text('example@gmail.com'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
            'assets/avatar/zakuro.jpg',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ))),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/icon/icon.png'),
            fit: BoxFit.cover,
          ))),
    ]));
  }
}
