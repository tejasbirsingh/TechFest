import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:techfest/DetailsPage.dart';

class ShowEvents extends StatefulWidget {
  final String branch;
  final String name;
  final String imagePath;
  final height;
  final width;
  final String anim;

  const ShowEvents(
      {Key key,
      @required this.branch,
      @required this.name,
      this.imagePath,
      this.anim,
      this.height,
      this.width})
      : super(key: key);

  @override
  _ShowEventsState createState() => _ShowEventsState();
}

class _ShowEventsState extends State<ShowEvents> {
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          gradient: LinearGradient(colors: [firstColor, secondColor]),
          title: Text(widget.name),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  child: Center(
                    child: FlareActor(widget.imagePath, animation: widget.anim),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Stack(
                children: <Widget>[
                  Events1(branchName: widget.branch),
                ],
              ),
            )
          ],
        ));
  }
}

class Events1 extends StatelessWidget {
  final String branchName;
  final String Name;

  const Events1({Key key, this.branchName, this.Name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(branchName).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(child: new Text('Error: ${snapshot.error}'));
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              scrollDirection: Axis.vertical,
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
                  child: Card(
                    color: Colors.white,
                    child: new ListTile(
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addDetails(
                                        event: document['title'],
                                        rules: document['rules'],
                                      )));
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        description(document['desc'], context);
                      },
                      title: Center(
                        child: new Text(
                          document['title'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }

  Future<void> description(document, context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: new Text("Description"),
          content: new Text(document),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
