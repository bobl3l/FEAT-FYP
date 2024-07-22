import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:feat/constants.dart';

Future<void> userSetup(
    name, weight, height, gender, fitnessgoal, dietrestriction) async {
  String? uid = await storage.read(key: 'uid');

  final newuser = <String, dynamic>{
    "name": "$name",
    "height": "$height",
    "gender": "$gender",
    "fitnessgoal": "$fitnessgoal",
    "dietres": "$dietrestriction",
    "water": 5.5,
    "sleep": 7.0,
    "exercise": 2.0,
    "calories": 2600,
    "diet": null,
    "workout": null,
    "achievements": null,
    "date": [DateTime.now()],
    "weight": ["$height"],
    "exp": "0",
    "id": uid!
  };

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

Future<void> bulkupdate(
    String collection, String doc, Map<String, dynamic> map) async {
  final newInput = db.collection(collection).doc(doc);
  await newInput.update(map);
}

Future<void> weightRecord(String weight) async {
  String? uid = await storage.read(key: 'uid');
  db.collection("users").doc(uid).update({
    "weight": FieldValue.arrayUnion([weight]),
    "date": FieldValue.arrayUnion([DateTime.now()])
  });
}
