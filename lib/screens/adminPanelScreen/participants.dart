import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class participants extends StatefulWidget {
  @override
  _participantsState createState() => _participantsState();
}

class _participantsState extends State<participants> {
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 10.0,
          centerTitle: true,
          title: Text('Participants'),
          gradient: LinearGradient(colors: [firstColor, secondColor])),
      body: Stack(
        children: <Widget>[
          players(),
        ],
      ),
    );
  }
}

class players extends StatefulWidget {
  @override
  _playersState createState() => _playersState();
}

class _playersState extends State<players> {
  TextEditingController controller = TextEditingController();
  String value = "as";
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
        Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: TextFormField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Enter event Name",
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (val) {
                  value = val;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GradientButton(
              gradient: Gradients.rainbowBlue,
              shadowColor: Gradients.rainbowBlue.colors.last.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text('Search'),
              callback: () {
                //To reload the page for fetching new data
                (context as Element).reassemble();
              },
            ),
            Expanded(child: list()),
          ],
        ),
      ],
    ));
  }

  Widget list() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Participants')
          .doc('event')
          .collection(value)
          .snapshots(),
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
                  snapshot.data.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: new ListTile(
                      title: new Text(
                        'Name    : \t' +
                            document['Name'] +
                            '\n' +
                            'Phone   : \t' +
                            document['Phone'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      subtitle: new Text(
                        'College : \t' +
                            document['College'] +
                            '\n' +
                            'Event    : \t' +
                            document['Event'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
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
}
