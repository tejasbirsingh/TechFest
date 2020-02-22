import 'package:flutter/material.dart';
import 'package:techfest/AddEvents.dart';
import 'package:techfest/participants.dart';

class selectionPage extends StatefulWidget {
  @override
  _selectionPageState createState() => _selectionPageState();
}

class _selectionPageState extends State<selectionPage> {
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0, left: 15.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 60.0,
                ),
                Text(
                  'Select Branch',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2 + 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0))),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    buttons('Project Display'),
                    buttons('CSE'),
                    buttons('ECE'),
                    buttons('IT'),
                    buttons('ME'),
                    buttons('EE'),
                    buttons('CIVIL'),
                    ButtonTheme(
                      height: 40.0,
                      minWidth: 200.0,
                      child: RaisedButton(
                        color: Colors.white60,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text('Names of Participants'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => participants()));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttons(branchname) {
    return ButtonTheme(
      height: 40.0,
      minWidth: 200.0,
      child: RaisedButton(
        color: Colors.white60,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text(branchname),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddEvents(
                    branch: branchname,
                  )));
        },
      ),
    );
  }
}
