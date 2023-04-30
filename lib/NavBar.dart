import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      UserAccountsDrawerHeader(
          accountName: Text('JP Mak'),
          accountEmail: Text('j29mak@uwaterloo.ca'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
            'assets/avatar/zakuro.jpg',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ))),
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/icon/icon.png'),
                fit: BoxFit.cover,
              ))),
      ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Certificates'),
        onTap: () => null,
      ),
    ]));
  }
}
