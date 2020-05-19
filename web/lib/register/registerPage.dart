import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:web/Body/registerPageHome.dart';
import 'package:web/NavBar/navBar.dart';
class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              NavBar(),
              registerPageHome()
            ],
          ),
        ));
  }

  registerPageHome() {}
}
