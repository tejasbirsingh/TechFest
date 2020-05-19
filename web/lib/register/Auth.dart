import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:web/Body/HomePage.dart';
import 'package:web/Body/LoginPage.dart';
import 'package:web/Body/registerPageHome.dart';

class AuthService {
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print('Signed in');
    }).catchError((e) {
      print(e);
    });
  }

  signUp(email, password) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password).then((user) {
         return user;
    }).catchError((e){
     print(e);
    });
  }
}