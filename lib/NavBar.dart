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
        title: Text('Favorites'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.people),
        title: Text('People'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Favorites'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.description),
        title: Text('Description'),
        onTap: () => null,
      ),
    ]));
  }
}
