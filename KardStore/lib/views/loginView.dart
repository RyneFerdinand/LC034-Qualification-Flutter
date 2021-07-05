import 'package:code/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:code/utils/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  // controllers
  var _emailControl = TextEditingController();
  var _passControl = TextEditingController();

  // error messages
  var _emailError;
  var _passError;

  bool validateEmail() {
    // email string
    String email = _emailControl.text.trim();

    // if the textfield is empty, set the error message
    if (email.isEmpty) {
      _emailError = 'email can\'t be empty !';
      return false;
      // if the email doesn't contain '@', set the error message
    } else if (!email.contains('@')) {
      _emailError = 'Email Must contain @ !';
      return false;
      // if the email doesn't end with .com, set the error message
    } else if (!email.endsWith('.com')) {
      _emailError = 'Email Must end with .com !';
      return false;
      // if the email is less than 6 characters, set the error message
    } else if (email.length < 6) {
      _emailError = 'email can\'t only contain @ and .com !';
      return false;
    }
    // if there's no error set the error message to null and return true
    _emailError = null;
    return true;
  }

  bool validatePassword() {
    // password string
    var pass = _passControl.text.trim();

    // if the textfield is empty, set the error message
    if (pass.isEmpty) {
      _passError = 'pass can\'t be empty !';
      return false;
      // if the password is less than 5 characters, set the error message
    } else if (pass.length < 5) {
      _passError = 'Password can\'t be less than 5 characters !';
      return false;
    }
    // if there's no error set the error message to null and return true
    _passError = null;
    return true;
  }

  void validate(BuildContext context) {
    // variables to get boolean value from validation
    var validPass = validatePassword();
    var validEmail = validateEmail();

    // if both password and email are valid
    if (validPass && validEmail) {
      // set username on globals (gotten from email until '@')
      globals.username =
          _emailControl.text.substring(0, _emailControl.text.indexOf('@'));
      // if it hasn't been initialized, initialize the data from globals (carousel, itemlist, etc.)
      if (globals.initialized == false) {
        globals.initializeData();
        globals.initialized = true;
      }

      // redirect to HomePage
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return HomePage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // create scaffold
    return Scaffold(
        //create appbar with title 'Kard Store'
        appBar: AppBar(
          title: Text('Kard Store'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          // set so that it's on the center
          child: Center(
            // SingleChildScrollView
            child: SingleChildScrollView(
              // Columns for the login page
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    // the card logo
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  // the login text
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'LOGIN',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // the email textfield
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        errorText: _emailError,
                      ),
                      controller: _emailControl,
                      // validator:
                    ),
                  ),
                  // the password textfield
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        errorText: _passError,
                      ),
                      obscureText: true,
                      controller: _passControl,
                    ),
                  ),
                  // the login button
                  ElevatedButton(
                      onPressed: () {
                        // set state so that the errorText can be updated
                        setState(() {
                          validate(context);
                        });
                      },
                      // the button's text
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
