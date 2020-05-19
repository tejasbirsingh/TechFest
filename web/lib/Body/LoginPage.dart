import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/Body/registerPageHome.dart';
import 'package:web/register/Auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final registerform = new GlobalKey<FormState>();
  String email , password;
  final formKey = new GlobalKey<FormState>();
  checkFields(){
    final form = formKey.currentState;
    if(form.validate()){
      return true;
    }
    else{
      return false;
    }
  }
  String validateEmail(String value){
    Pattern  pattern=   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(!regex.hasMatch(value))
      return 'Enter valid email';
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2  + 300.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white70,Colors.blueAccent.withOpacity(0.1)],
                begin: Alignment.topCenter,

                end: Alignment.bottomCenter

              )
            ),
          ),
          Container(
          width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 9,

            decoration: BoxDecoration(
              color: Colors.blue.shade900.withOpacity(0.8)
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 80.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),),
               Padding(
                 padding:  EdgeInsets.only(right:10.0),
                 child: Form(
    key: formKey,
    child: Row(

    children: <Widget>[
      SizedBox(
        height:30.0,
        width: 120.0,
        child: TextFormField(


          keyboardType: TextInputType.emailAddress,


    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 15.0),
    filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      fillColor: Colors.white,
    hintText: 'Email',
    ),
    validator: (value)=>value.isEmpty ?' Email is required':
    validateEmail(value.trim()),
    onChanged: (val){
        this.email= val;
    },
    ),
      ),
      SizedBox(width: 10.0,),
      Container(
        height:30.0,
        width: 120.0,
        child: TextFormField(

          keyboardType: TextInputType.text,
          obscureText: true,


          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.0),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              fillColor: Colors.white,
            hintText: 'Password'
          ),
          validator: (value)=>value.length <6  ?'Password} is required': null,

          onChanged: (val){
              this.password= val;
          },
        ),
      ),
      SizedBox(width: 10.0,),
      ButtonTheme(
        minWidth: 60.0,
        height: 30.0,
        child: RaisedButton(

          color: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          child: Text('Log In'),
          onPressed: (){   if (checkFields()) {
            AuthService().signIn(email, password);
          }

          },
        ),
      )

    ],
    ),
    ),
               )
                  ],
                )
          ),
          Positioned(
            top: 100.0,
            left: MediaQuery.of(context).size.width/ 2+ 100.0 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Create an account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),),
                Text("It's quick and easy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0
                ),),
                SizedBox(height: 20.0,),
                Form(
                  key: registerform,
                 child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                       children: <Widget>[
                         Container(height: 40.0,
                           
                           width: 200.0,
                           child:    TextFormField(
                             

                             decoration: InputDecoration(hintText: 'Email',
                             contentPadding: EdgeInsets.all(10.0),
                             fillColor: Colors.white,
                             filled: true,
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(color: Colors.white)
                             )),

                             validator: (value) => value.isEmpty
                                 ? 'Email is required'
                                 : validateEmail(value.trim()),
                             onChanged: (value) {
                               this.email = value;
                             },
                           ),
                         ),
                         SizedBox(width: 20.0,),
                         Container(
                           height: 40.0,
                           width: 200.0,
                           child:    TextFormField(
                             obscureText: true,
                             decoration:
                             InputDecoration(hintText: 'Password',
                                 contentPadding: EdgeInsets.all(10.0),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.white)
    )),
                             validator: (value) => value.isEmpty
                                 ? 'Password is required'
                                 : null,
                             onChanged: (value) {
                               this.password = value;
                             },
                           ),
                         )
                       ],
                     ),
                     SizedBox(height: 10.0,),
                     Container(
                       height: 40.0,
                       width: 420.0,
                       child: TextFormField(
                         decoration: InputDecoration(
                           hintText: 'Mobile number or email address',
                           fillColor: Colors.white,
                           filled: true,
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                                 borderSide: BorderSide(color: Colors.white)
                             )
                         ),
                       ),
                     ),
                     SizedBox(height: 10.0,),
                     Container(
                       height: 40.0,
                       width: 420.0,
                       child: TextFormField(
                         decoration: InputDecoration(
                             hintText: 'New password',
                             fillColor: Colors.white,
                             filled: true,
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                                 borderSide: BorderSide(color: Colors.white)
                             )
                         ),
                       ),
                     ),
                     SizedBox(height: 20.0,),
                     Text(
                       'Birthday',
                       style: TextStyle(
                         color: Colors.grey,
                         fontWeight: FontWeight.bold,
                         fontSize: 18.0
                       ),
                     )
                   ],
                 ),
                ),

              ],
            ),
          )

              ],
            ),

         );


  }
}
