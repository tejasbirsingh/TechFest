import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:techfest/LoginPage.dart';
import 'package:techfest/ShowEvents.dart';
import 'package:techfest/developerPage.dart';
import 'package:techfest/searchSearch.dart';

import 'DetailsPage.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);
  Widget menu = Icon(Icons.menu);
  var options = ['Login', 'Developer'];
  bool menuShown = false;

  double appbarHeight = 80.0;

  double menuHeight = 0.0;

  Color textColor = Colors.white;
  final Color primary = Color(0xff291747);

  final Color active = Color(0xff6C48AB);

  Animation animation;
  Animation searchAnimation;
  AnimationController animationController;
  TabController tabController;

  var queryResultSet = [];
  var tempSearchStore = [];

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [firstColor.withOpacity(0.1), secondColor])),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          height: 200,
                          width: 300.0,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                'images/davietglow.png',
                              ))),
                      _buildRow(
                          Icons.present_to_all,
                          "Project Display",
                          ShowEvents(
                            branch: "ProjectDisplay",
                            name: 'Project Display',
                            imagePath: 'images/pd.flr',
                            anim: 'go',
                            width: 200.0,
                            height: 200.0,
                          )),
                      _buildDivider(),
                      _buildRow(
                          Icons.computer,
                          "CSE",
                          ShowEvents(
                            branch: "CSE",
                            name: "Computer Science",
                            imagePath: 'images/cse.flr',
                            anim: 'coding',
                            height: 200.0,
                            width: 200.0,
                          )),
                      _buildDivider(),
                      _buildRow(
                          FontAwesomeIcons.microchip,
                          "ECE",
                          ShowEvents(
                            branch: "ECE",
                            name: "Electronics",
                            imagePath: 'images/ece.flr',
                            anim: 'Cargando',
                            height: 200.0,
                            width: 200.0,
                          )),
                      _buildDivider(),
                      _buildRow(
                          FontAwesomeIcons.elementor,
                          "EE",
                          ShowEvents(
                            branch: "EE",
                            name: "Electrical",
                            imagePath: 'images/ee.flr',
                            anim: 'bolt',
                            height: 150.0,
                            width: 150.0,
                          )),
                      _buildDivider(),
                      _buildRow(
                          Icons.computer,
                          "IT",
                          ShowEvents(
                            branch: "IT",
                            name: "Information Technology",
                            imagePath: 'images/cse.flr',
                            anim: 'coding',
                            height: 200.0,
                            width: 200.0,
                          )),
                      _buildDivider(),
                      _buildRow(
                          FontAwesomeIcons.car,
                          "ME",
                          ShowEvents(
                            branch: "ME",
                            name: "Mechanical",
                            imagePath: 'images/me.flr',
                            anim: 'Untitled',
                            height: 200.0,
                            width: 200.0,
                          )),
                      _buildDivider(),
                      _buildRow(
                          FontAwesomeIcons.building,
                          "CE",
                          ShowEvents(
                            branch: "CE",
                            name: "Civil",
                            imagePath: 'images/build.flr',
                            anim: 'Untitled',
                            height: 200.0,
                            width: 200.0,
                          )),
                      _buildDivider(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title, Page) {
    final TextStyle tStyle = TextStyle(color: Colors.black, fontSize: 16.0);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Page));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ]),
      ),
    );
  }

  Widget dropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(
          Icons.more_vert,
          color: textColor,
        ),
        elevation: 1,
        isExpanded: false,
        focusColor: Colors.blueGrey,
        iconSize: 30.0,
        iconEnabledColor: Colors.white,
        isDense: true,
        items: options.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
              ));
        }).toList(),
        onChanged: (String val) {
          if (val == 'Login') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
          if (val == 'Developer') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => developerPage()),
            );
          }
        },
      ),
    );
  }

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['title'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            drawer: _buildDrawer(),
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blueGrey.withOpacity(0.5),
                    Colors.blue.withOpacity(0.1),
                    Colors.blueGrey.withOpacity(0.5)
                  ])),
                ),
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      firstColor,
                      secondColor,
                    ])),
                  ),
                ),
                Positioned(
                  child: AppBar(
                    centerTitle: true,
                    iconTheme: IconThemeData(color: textColor),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: dropDown(),
                      )
                    ],
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      'Events',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 120.0, left: 30.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Container(
                          width: 270.0,
                          height: 50.0,
                          child: TextField(
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            cursorColor: textColor,
                            onChanged: (val) {
                              initiateSearch(val);
                            },
                            decoration: InputDecoration(
                                suffixIcon:
                                    Icon(Icons.search, color: textColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(16.0),
                                hintStyle: TextStyle(
                                  color: textColor,
                                ),
                                hintText: 'Search Events',
                                fillColor: Colors.white38,
                                filled: true),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0, right: 10),
                        child: GridView.count(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            crossAxisCount: 3,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing: 3.0,
                            primary: false,
                            shrinkWrap: true,
                            children: tempSearchStore.map((element) {
                              return buildResultCard(element);
                            }).toList()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 260.0, left: 10.0, right: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2 + 40.0,
                    child: TabBarView(
                      controller: tabController,
                      children: <Widget>[
                        GradientCard(
                          gradient: LinearGradient(colors: [
                            firstColor,
                            secondColor,
                          ]),
                          elevation: 10.0,
                          shadowColor: Colors.white12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: EventsList(),
                        ),
                        GradientCard(
                          elevation: 10.0,
                          shadowColor: Colors.white12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Events1(),
                          gradient: LinearGradient(colors: [
                            firstColor,
                            secondColor,
                          ]
                              //   colors:[Colors.orange,Color(0xFFF44336)]
                              //colors:[Color(0xFFFFD600),Colors.orange]
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: TabBar(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      controller: tabController,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 1.0,
                      isScrollable: true,
                      labelColor: Colors.white30,
                      labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
                      unselectedLabelStyle: TextStyle(color: Colors.grey),
                      unselectedLabelColor: Colors.grey,
                      tabs: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  firstColor,
                                  secondColor,
                                ]),
                                borderRadius: BorderRadius.circular(40.0)),
                            child: Tab(
                              child: Text(
                                'Day 1',
                                style:
                                    TextStyle(color: textColor, fontSize: 25.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                firstColor,
                                secondColor,
                              ]),
                              borderRadius: BorderRadius.circular(40.0)),
                          child: Tab(
                            child: Text(
                              'Day 2',
                              style:
                                  TextStyle(color: textColor, fontSize: 25.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildResultCard(element) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => addDetails(
                    event: element['title'], rules: element['rules'])));
      },
      child: Card(
        color: Colors.white.withOpacity(0.8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2.0,
        child: Container(
          child: Center(
            child: Text(
              element['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Day 1').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(child: new Text('Error: ${snapshot.error}'));
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
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
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    description(document['desc'], context);
                  },
                  title: Center(
                    child: new Text(
                      document['title'],
                      style: TextStyle(
                        color: Colors.white,
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
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: new Text("Description"),
          content: new Text(document),
          actions: <Widget>[
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

class Events1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Day 2').snapshots(),
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
                return new ListTile(
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addDetails(
                                  event: document['title'],
                                  rules: document['rules'])));
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
                    child: new Text(
                      document['title'],
                      style: TextStyle(
                        color: Colors.white,
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
