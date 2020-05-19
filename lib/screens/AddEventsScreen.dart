import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'file:///E:/IdeaProjects/techfest/lib/screens/eventRegister.dart';

import 'package:flutter/services.dart';
import 'package:flushbar/flushbar.dart';


class AddEvents extends StatefulWidget {
  final String branch;

  AddEvents({Key key, @required this.branch}) : super(key: key);

  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  var day = '';
  eventRegister curdObj = new eventRegister();

  normal(BuildContext context, textname) async {
    Flushbar(
      title: textname,
      message: 'Event added successfully ',
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticInOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.blue.shade500, Colors.blue.shade700]),
      isDismissible: false,
      icon: Icon(
        Icons.check,
        size: 35.0,
        color: Colors.green,
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.grey,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(context);
  }

  var _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController rulesController = TextEditingController();

  TextEditingController descController = TextEditingController();
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);

  @override
  void initState() {
    titleController.text = "";
    rulesController.text = "";
    descController.text = "";
    day = "Day 1";
    choice = 'one';
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Map<String, String> register = {};
  static const color = const Color(0xFF8E24AA);
  var a = 1;
  String _radioValue;
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = 'one';
          day = 'Day 1';
          break;

        case 'two':
          choice = 'two';
          day = 'Day 2';
          break;

        default:
          choice = 'one';
          day = 'Day 1';
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 'one',
                              groupValue: _radioValue,
                              activeColor: Colors.white,
                              onChanged: radioButtonChanges,
                            ),
                            Text(
                              'Day 1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Radio(
                              value: 'two',
                              activeColor: Colors.white,
                              groupValue: _radioValue,
                              onChanged: radioButtonChanges,
                            ),
                            Text(
                              'Day 2',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 40.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: titleController,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    labelText: 'Title'),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter the title!';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: descController,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: 'Description',
                                ),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter the Description!';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                controller: rulesController,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    labelText: 'Rules'),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter the Rules!';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: Text('Register'),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    register = {
                                      'rules': rulesController.text,
                                      'title': titleController.text[0]
                                              .toUpperCase() +
                                          titleController.text.substring(1),
                                      'desc': descController.text,
                                      'searchKey':
                                          titleController.text[0].toUpperCase()
                                    };

                                    Firestore.instance
                                        .collection(widget.branch)
                                        .add(register)
                                        .catchError((e) {
                                      print(e);
                                    });

                                    Firestore.instance
                                        .collection(day)
                                        .add(register)
                                        .catchError((e) {
                                      print(e);
                                    });

                                    Firestore.instance
                                        .collection('Events')
                                        .add(register)
                                        .catchError((e) {
                                      print(e);
                                    });

                                    normal(context, titleController.text);
                                  }

                                  titleController.text = "";

                                  descController.text = "";

                                  rulesController.text = "";

                                  day = "Day 1";
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildCard(rules, height) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 2.0,
      child: Container(
        height: height,
        child: Center(
          child: Text(
            rules,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
