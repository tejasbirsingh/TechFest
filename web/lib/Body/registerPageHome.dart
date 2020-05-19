
import 'package:flutter/material.dart';
import 'package:web/register/Auth.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade500,Colors.blue.shade800]
                  )
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text('Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                ),),
            ),
            Center(
              child: Container(
                  height: 250.0,
                  width: 300.0,
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0,
                                      right: 25.0,
                                      top: 20.0,
                                      bottom: 5.0),
                                  child: Container(
                                    height: 50.0,
                                    child: TextFormField(
                                      decoration:
                                      InputDecoration(hintText: 'Email'),
                                      validator: (value) => value.isEmpty
                                          ? 'Email is required'
                                          : validateEmail(value.trim()),
                                      onChanged: (value) {
                                        this.email = value;
                                      },
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0,
                                      right: 25.0,
                                      top: 20.0,
                                      bottom: 5.0),
                                  child: Container(
                                    height: 50.0,
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration:
                                      InputDecoration(hintText: 'Password'),
                                      validator: (value) => value.isEmpty
                                          ? 'Password is required'
                                          : null,
                                      onChanged: (value) {
                                        this.password = value;
                                      },
                                    ),
                                  )),
                              InkWell(
                                  onTap: () {
                                    if (checkFields()) {
                                      var x=  AuthService().signUp(email, password);
                                      showDialog(context: context,
                                          builder: (BuildContext context){
                                            return AlertDialog(
                                              title: Text('Email already exists'),
                                            );
                                          });
                                    }
                                  },
                                  child: Container(
                                      height: 40.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.2),
                                      ),
                                      child: Center(child: Text('Sign in'))))
                            ],
                          ))
                    ],
                  )),
            ),
          ],
        ));
  }
}