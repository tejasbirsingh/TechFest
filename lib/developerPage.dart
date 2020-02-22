import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class developerPage extends StatefulWidget {
  @override
  _developerPageState createState() => _developerPageState();
}

class _developerPageState extends State<developerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Center(
                child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 80.0,
                  child: Image.asset('images/tf.png'),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
