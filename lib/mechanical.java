import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techfest/DetailsPage.dart';

class mechanical extends StatefulWidget {
  @override
  _mechanicalState createState() => _mechanicalState();
}

class _mechanicalState extends State<mechanical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.withOpacity(0.7),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Mechanical'),
        ),
        body: Stack(

          children: <Widget>[
            Container(
              height: 150.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top:150.0),
              child: Events1(),
            )
          ],
        )
    );
  }
}
class Events1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ME').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(child: new Text('Error: ${snapshot.error}'));
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              scrollDirection: Axis.vertical,

              children: snapshot.data.documents.map((
                  DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 2.0),
                  child: Card(
                    color: Colors.purple,
                    child: new ListTile(
                      trailing:GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => addDetails(event:document['Title'],rules: document['rules'],)
                          ));
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        description(document['desc'], context);
                      },
                      title: Center(
                        child: new Text(document['Title'],
                          style: TextStyle(
                              color: Colors.white
                          ),),
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
    return showDialog(context: context,
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
      },);
  }
}