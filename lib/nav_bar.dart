import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

String userName = "Matthew";
String userEmail = "mk2athan@uwaterloo.ca";

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  void f1() {
    return;
  }

  void f2() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/avatar/image.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 34, 29, 31),
              image: DecorationImage(
                image: AssetImage('assets/icon/icon.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Certificates'),
            onTap: () => f1(),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => f2(),
          ),
        ],
      ),
    );
  }
}
