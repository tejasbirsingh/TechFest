import 'dart:async';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen2 extends StatefulWidget {
  @override
  _splashScreen2State createState() => _splashScreen2State();
}

class _splashScreen2State extends State<splashScreen2> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(milliseconds: 2000), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacementNamed('/EventPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF00ACC1), Color(0xFF0D47A1)])),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                ),

//                RotationAnimatedWidget.tween(
//                    rotationDisabled: Rotation.deg(z: 360),
//                    rotationEnabled: Rotation.deg(z: 0),
//                    duration: Duration(seconds: 1),
//                    /* your widget */
//                ),
              OpacityAnimatedWidget.tween(
                opacityEnabled: 1, //define start value
                opacityDisabled: 0,
                duration: Duration(seconds: 1),
                child:ScaleAnimatedWidget.tween(

                  duration: Duration(seconds: 1),
                  scaleDisabled: 0.2,
                  scaleEnabled: 1,
                  child:  Container(
                      height: 300.0,
                      width: 300.0,
                      child: Image.asset('images/davietglow.png')),
                ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 200.0,
                  width: 200.0,
                  child: FlareActor(
                    'images/loader.flr',
                    animation: 'Loading',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
