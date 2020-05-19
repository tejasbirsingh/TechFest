

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techfest/screens/EventsPage.dart';
import 'package:techfest/startupScreens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DavietTechFest2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashScreen2(),
      routes: <String, WidgetBuilder>{
        '/EventPage': (BuildContext context) => EventsPage()
      },
    );
  }
}
