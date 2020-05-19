import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class developerPage extends StatefulWidget {
  @override
  _developerPageState createState() => _developerPageState();
}

class _developerPageState extends State<developerPage> {
  final Color firstColor = Color(0xFF00ACC1);
  final Color secondColor = Color(0xFF0D47A1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),

        ),
        gradient:LinearGradient(colors:[firstColor, secondColor]),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Center(
                child: Column(

              children: <Widget>[
                ScaleAnimatedWidget.tween(
                  duration:Duration(milliseconds: 600),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset('images/profile.jpg',width: 200.0,
                    fit: BoxFit.fill,
                    height: 200.0,),
                  ),
                ),
                SizedBox(height: 40.0,),
                Padding(
                  padding:  EdgeInsets.only(left:18.0,right: 18.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OpacityAnimatedWidget.tween(
                        duration: Duration(milliseconds: 800),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              text('Name' , 'Tejas Bir Singh '),
                              SizedBox(height: 20.0,),
                              text('Contact', '9988113597'),
                              SizedBox(height: 20.0,),
                              text('Mail', 'tejasbir.rekhi@gmail.com'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          )
        ],
      ),
    );
  }
  Widget text(field, value ){
    return Column(

      children: <Widget>[
        Row(
          children: <Widget>[
            Text(field +' - ' , style:TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),

            SizedBox(width: 10.0,),
            Text(value ,style: TextStyle(
              color: Colors.black,
              fontSize: 20.0


            ),),

          ],
        ),
        Padding(
          padding:  EdgeInsets.only(left:10.0, right: 10.0),
          child: Container(
            height: 10.0,
            child: Divider(

              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
