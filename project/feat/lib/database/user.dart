import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feat/configuration.dart';
import 'package:feat/constants.dart';

class UserDetails {
  final dynamic id;
  final dynamic calories;
  final dynamic sleep;
  final dynamic exercise;
  final dynamic water;
  final dynamic diet;
  final dynamic workout;
  UserDetails(
      {this.id,
      this.calories,
      this.diet,
      this.exercise,
      this.sleep,
      this.water,
      this.workout});

  factory UserDetails.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserDetails(
      id: data?['id'],
      calories: data?['calories'],
      diet: data?['diet'],
      exercise: data?['exercise'],
      sleep: data?['sleep'],
      water: data?['water'],
      workout: data?['workout'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (calories != null) "calories": calories,
      if (diet != null) "diet": diet,
      if (exercise != null) "exercise": exercise,
      if (sleep != null) "sleep": sleep,
      if (water != null) "water": water,
      if (workout != null) "workout": workout,
    };
  }
}

Future<UserDetails> getDetails() async {
  String? uid = await storage.read(key: 'uid');
  final ref = db.collection("users").doc(uid).withConverter(
        fromFirestore: UserDetails.fromFirestore,
        toFirestore: (UserDetails details, _) => details.toFirestore(),
      );
  final docSnap = await ref.get();
  final details = docSnap.data(); // Convert to details object
  if (details != null) {
    print(details);
  } else {
    print("No such document.");
  }
  return details!;
}
