import 'package:animated_widgets/animated_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../selectionPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscureText = true;
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checked = false;
  SharedPreferences prefs;

  @override
  void initState() {
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [firstColor, secondColor])),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 12.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ScaleAnimatedWidget.tween(
                    duration: Duration(milliseconds: 600),
                    child: _buildLoginForm()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.trim(), password: _password);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => selectionPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  Container _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white.withOpacity(0.9),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: email,
                          onSaved: (input) => _email = input,
                          keyboardType: TextInputType.emailAddress,
                          // ignore: missing_return
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide an email!';
                            }
                          },

                          autofocus: false,
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              hintText: "Email address",
                              hintStyle: TextStyle(color: Colors.blue.shade200),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              )),
                        )),
                    Container(
                      child: Divider(
                        color: Colors.blue.shade400,
                      ),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: password,

//                          initialValue:checked ? _password: "",
                          autofocus: false,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.text,
                          onSaved: (input) => _password = input,
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Please provide the password!';
                            }
                          },
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  semanticLabel: _obscureText
                                      ? 'Show Password'
                                      : 'Hide Password',
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.blue.shade200),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                              )),
                        )),
                    Container(
                      child: Divider(
                        color: Colors.blue.shade400,
                      ),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Remember me',
                        style: TextStyle(fontSize: 15.0, color: Colors.blue),
                      ),
                      checkColor: Colors.blue,
                      activeColor: Colors.white,
                      value: checked,
                      onChanged: _onChanged,
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: signIn,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text("Login", style: TextStyle(color: Colors.white70)),
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  _onChanged(bool value) async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      checked = value;
      prefs.setBool('check', checked);
      prefs.setString('email', email.text);
      prefs.setString('password', password.text);
      prefs.commit();
    });
  }

  getCredential() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      checked = prefs.getBool('check');
      if (checked != null) {
        if (checked) {
          email.text = prefs.getString("email");
          password.text = prefs.getString("password");
        } else {
          email.clear();
          password.clear();
          prefs.clear();
        }
      } else {
        checked = false;
      }
    });
  }
}
