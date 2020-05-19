import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'file:///E:/IdeaProjects/techfest/lib/screens/AddEventsScreen.dart';

import '../search/serviceFile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget menu = Icon(Icons.menu);
  var options = ['CSE', 'ECE', 'ME', 'IT', 'EE'];
  crudMethod curdObj = new crudMethod();

  normal(BuildContext context, textname) async {
    Flushbar(
      title: textname,
      message: 'Successfully added event data ',
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
          LinearGradient(colors: [Colors.purple, Colors.purpleAccent.shade700]),
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
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('REGISTER'),
          backgroundColor: Colors.purple.shade700.withOpacity(0.8),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40.0, right: 200.0),
              child: DropdownButton<String>(
                isExpanded: true,
                icon: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4)),
                    child: Icon(
                      Icons.menu,
                    )),
                iconSize: 30.0,
                iconEnabledColor: Colors.purple,
                items: options.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem));
                }).toList(),
                onChanged: (String val) {
                  if (val == 'CSE') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEvents(branch: val)));
                  }
                  if (val == 'ECE') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEvents(
                                branch: val,
                              )),
                    );
                  }
                  if (val == 'ME') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEvents(
                                branch: val,
                              )),
                    );
                  } else if (val == 'EE') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEvents(
                                branch: val,
                              )),
                    );
                  } else if (val == 'IT') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEvents(
                                branch: val,
                              )),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
