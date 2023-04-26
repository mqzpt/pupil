import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
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
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/icon/icon.png'),
                fit: BoxFit.cover,
              ))),
      ListTile(
        leading: Icon(Icons.favorite),
        title: Text('favorites'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.people),
        title: Text('people'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.share),
        title: Text('share'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.notifications),
        title: Text('favorites'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('settings'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.description),
        title: Text('description'),
        onTap: () => null,
      ),
    ]));
  }
}
