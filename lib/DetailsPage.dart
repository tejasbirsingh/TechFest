import 'package:flare_flutter/flare_actor.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'serviceFile.dart';

class addDetails extends StatefulWidget {
  final String event, rules;

  addDetails({Key key, @required this.event, @required this.rules})
      : super(key: key);

  @override
  _addDetailsState createState() => _addDetailsState();
}

class _addDetailsState extends State<addDetails> {
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);
  var success = 0;
  crudMethod curdObj = new crudMethod();

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

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController collegeController = TextEditingController();

  @override
  void initState() {
    nameController.text = "";
    phoneController.text = "";
    collegeController.text = "";
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Map<String, String> register = {};
  static const color = const Color(0xFF8E24AA);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2 - 150.0;

    return Scaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        gradient: LinearGradient(colors: [
          firstColor,
          secondColor,
        ]),
        elevation: 0.0,
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor,
              ]),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  child: FlareActor(
                    'images/trophy.flr',
                    animation: 'Untitled',
                  ),
                ),
//                Padding(
//                    padding: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
//                    child: BuildCard(widget.rules,height)
//                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: height / 2 - 80.0,
                      left: 20.0,
                      right: 20.0,
                      bottom: 40.0),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0)),
                        color: Colors.white,
                      ),
                      height: 320.0,
                      width: 400.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: 'Name'),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please enter the name!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: collegeController,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                labelText: 'College Name',
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please enter the College Name!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: 'Mobile Number'),
                              validator: (val) {
                                if (val.length < 10 || val.length > 10) {
                                  return 'Please enter the PhoneNumber!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            RaisedButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              child: Text('Register'),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  register = {
                                    'Event': widget.event,
                                    'Name': nameController.text,
                                    'College': collegeController.text,
                                    'Phone': phoneController.text
                                  };
                                  curdObj
                                      .addData(register, widget.event)
                                      .then((result) {
                                    normal(context, nameController.text);
//                          _scaffoldKey.currentState.showSnackBar(
//                              SnackBar(
//                                content: Text(nameController.text+'you have been register in ' + widget.event),
//                                duration: Duration(seconds: 3),
//                              ));
                                  }).catchError((e) {
                                    print(e);
                                  });
                                }
                                nameController.text = "";
                                collegeController.text = "";
                                phoneController.text = "";
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                    alignment: Alignment.bottomCenter,
                    child: bottomSheet(
                      rules: widget.rules,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget BuildCard(rules, height) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 15.0,
      child: Container(
        height: height,
        child: Column(
          children: <Widget>[
            Text(
              'Rules',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                rules,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bottomSheet extends StatelessWidget {
  final String rules;

  const bottomSheet({Key key, this.rules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: 50.0,
            width: 80.0,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(5, 5), blurRadius: 12.0)
            ], color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
            child: Center(
                child: Text('Rules',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0)))),
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0))),
              context: context,
              builder: (context) => Container(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left:
                                  MediaQuery.of(context).size.width / 2 - 30.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Rules',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(rules)
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: FlareActor(
                                'images/close.flr',
                                animation: 'Error',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                  ));
        });
  }
}
