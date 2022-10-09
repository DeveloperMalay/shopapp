import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum ApplicationLoginState { loggedIn, loggedOut }

class ApplicationState extends ChangeNotifier {
  User? user;
  ApplicationLoginState loginState = ApplicationLoginState.loggedOut;
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if (userFir != null) {
        loginState = ApplicationLoginState.loggedIn;
        user = userFir;
      } else {
        loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  Future<void> signIn(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signUp(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      UserCredential usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //stripe user create
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
