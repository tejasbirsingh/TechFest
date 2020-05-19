import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/Body/HomePage.dart';
class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopNavBar();
      } else if (constraints.maxWidth > 200 && constraints.maxWidth < 1200) {
        return DesktopNavBar();
      } else {
        return MobileNavBar();
      }
    });
  }
}

class DesktopNavBar extends StatefulWidget {
  @override
  _DesktopNavBarState createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  String _email = '';

  String _password = '';

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = '';
    _password = '';
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      color: Colors.blue.shade900.withOpacity(0.8),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width, maxHeight: 600.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'facebook',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            Form(
              key: formkey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email or phone',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: Colors.white,
                          width: 150.0,
                          height: 20.0,
                          child: TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Email can\'t be empty' : null,
                            onChanged: (value) {
                              _email = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 70.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: Colors.white,
                          width: 150.0,
                          height: 20.0,
                          child: TextFormField(
                            validator: (value) => value.length < 6
                                ? 'Password cant be empty or less than 6 letters'
                                : null,
                            onChanged: (value) {
                              var _password = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgotten account?',
                            style: TextStyle(color: Colors.white30),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: MaterialButton(
                      minWidth: 60.0,
                      height: 20.0,
                      color: Colors.blue.shade900.withOpacity(0.7),
                      onPressed: () {

                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MobileNavBar extends StatefulWidget {
  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              'facebook',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email or phone',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: Colors.white,
                          width: 150.0,
                          height: 20.0,
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 70.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: Colors.white,
                          width: 150.0,
                          height: 20.0,
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgotten account?',
                            style: TextStyle(color: Colors.white30),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: MaterialButton(
                      minWidth: 60.0,
                      height: 20.0,
                      color: Colors.blue.shade900.withOpacity(0.7),
                      onPressed: () {},
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
