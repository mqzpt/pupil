import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:share_plus/share_plus.dart';

String username = "Matthew";
String useremail = "mk2athan@uwaterloo.ca";

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      UserAccountsDrawerHeader(
          accountName: Text(username),
          accountEmail: Text(useremail),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
            'assets/avatar/image.jpg',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ))),
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/icon/icon.png'),
                fit: BoxFit.cover,
              ))),
      // ListTile(
      //   leading: const Icon(Icons.share),
      //   title: const Text('Profile'),
      //   onTap: () async {
      //     // Show pop-up menu and wait for user selection
      //     final result = await showMenu(
      //       context: context,
      //       position: RelativeRect.fromLTRB(0, 0, 0, 0),
      //       items: [
      //         PopupMenuItem(
      //           child: Text('Share via iOS Share Sheet'),
      //           value: 'share',
      //         ),
      //       ],
      //     );

      //     // Handle user selection
      //     if (result == 'share') {
      //       await Share.share('https://github.com/mqzpt');
      //     }
      //   },
      // ),
      ListTile(
        leading: const Icon(Icons.star),
        title: const Text('Certificates'),
        onTap: () => null,
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Profile'),
        onTap: () => null,
      ),
    ]));
  }
}
