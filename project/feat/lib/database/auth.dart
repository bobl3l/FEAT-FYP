import 'package:firebase_auth/firebase_auth.dart';
import 'package:feat/constants.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  String? id;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signin(
      {required String email, required String password}) async {
    String o = 'success';
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await storage.write(key: 'email', value: email);
      await storage.write(key: 'password', value: password);
      getUID();
    } on FirebaseAuthException catch (e) {
      o = 'error';
    }

    return o;
  }

  Future<void> newpassword(String password) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
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

  Future<String> getUID() async {
    if (FirebaseAuth.instance.currentUser != null) {
      id = FirebaseAuth.instance.currentUser?.uid;
      await storage.write(key: 'uid', value: id);
    } else {
      id = 'nouser';
    }
    return id!;
  }
}


//admin pw=admin123

