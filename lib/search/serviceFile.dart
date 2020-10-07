import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethod {
  @override
  Future<void> initState() async {}

  static get auth => null;

  Future<void> addData(name, event) async {
    FirebaseFirestore.instance
        .collection('Participants')
        .doc('event')
        .collection(event)
        .add(name)
        .catchError((e) {
      print(e);
    });
  }
}
