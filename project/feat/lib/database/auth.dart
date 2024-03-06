import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:feat/constants.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signin({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
    getUID();
  }

  Future<void> signup({required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
    getUID();
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await storage.deleteAll();
  }

  Future<void> getUID() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      await storage.write(key: 'uid', value: uid);
    }
  }
}

void getUser() async {
  String? uid = await storage.read(key: 'uid');
  final docRef = db.collection("users").doc(uid);

  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
    },
    onError: (e) => print("Error getting document: $e"),
  );
}


//admin pw=admin123

