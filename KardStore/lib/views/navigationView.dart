import 'package:code/views/homeView.dart';
import 'package:code/views/itemView.dart';
import 'package:code/views/loginView.dart';
import 'package:flutter/material.dart';
import 'package:code/utils/globals.dart' as globals;

class NavBar extends StatelessWidget {
  void navigate(BuildContext context, String menu) {
    // navigate to HomePage
    if (menu.toLowerCase().compareTo('home') == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return HomePage();
      }));
      // navigate to ItemPage
    } else if (menu.toLowerCase().compareTo('item') == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return ItemPage();
      }));
      // navigate to LoginPage and set the username to empty
    } else if (menu.toLowerCase().compareTo('login') == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        globals.username = '';
        return LoginPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // create drawer
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            // to show the person that's login
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 35,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      // username from globals (set when logged in)
                      globals.username,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Home Navigation
          ListTile(
            title: TextButton(
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.home),
                    Text(
                      '  Home',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              onPressed: (() {
                navigate(
                  context,
                  'home',
                );
              }),
            ),
          ),
          // ItemPage Navigation
          ListTile(
            title: TextButton(
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    Text(
                      '  Kards',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              onPressed: (() {
                navigate(context, 'item');
              }),
            ),
          ),
          // Logout Navigation
          ListTile(
            title: TextButton(
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    Text(
                      '  Logout',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              onPressed: (() {
                navigate(context, 'login');
              }),
            ),
          ),
        ],
      ),
    );
  }
}
