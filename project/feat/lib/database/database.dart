import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';
import 'package:feat/constants.dart';

void userSetup(
    name, weight, height, gender, fitnessgoal, dietrestriction) async {
  final newuser = <String, Object>{
    "name": "$name",
    "height": "$height",
    "gender": "$gender",
    "fitnessgoal": "$fitnessgoal",
    "dietrestriction": "$dietrestriction",
  };
  final nestedarray = {
    "weight": weight,
    "time": Timestamp.now(),
  };

  newuser["weight"] = nestedarray;
  String? uid = await storage.read(key: 'uid');

  db
      .collection("users")
      .doc(uid)
      .set(newuser)
      .onError((e, _) => print("Error writing document: $e"));
}

Future<void> update(
    String collection, String doc, String variable, dynamic input) async {
  final newInput = db.collection(collection).doc(doc);
  await newInput.update({variable: input});
}

Future<void> weightRecord(String weight) async {
  String? uid = await storage.read(key: 'uid');
  db.collection("users").doc(uid).update({
    "weight": FieldValue.arrayUnion([weight]),
    "date": FieldValue.arrayUnion([DateTime.now()])
  });
}
