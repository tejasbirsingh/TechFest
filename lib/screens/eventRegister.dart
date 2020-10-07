import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class eventRegister{

  Future<void> addData(branch,name) async{
    FirebaseFirestore.instance.collection(branch).add(name).catchError((e){
      print(e);
    });


  }
}