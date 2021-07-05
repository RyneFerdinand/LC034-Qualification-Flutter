import 'package:code/views/loginView.dart';
import 'package:flutter/material.dart';
import 'package:code/utils/globals.dart' as globals;

// The main function
void main() {
  runApp(kardStoreApp());
}

class kardStoreApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // the createState calls the KardAppState
    return KardAppState();
  }
}

class KardAppState extends State<kardStoreApp> {
  // initialize listener for theme change
  @override
  void initState() {
    super.initState();
    globals.currTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme setting
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        // the theme mode calls the currTheme() method to get the current theme from globals
        themeMode: globals.currTheme.currTheme(),
        // calls LoginPage() from loginView.dart
        home: LoginPage());
  }
}
