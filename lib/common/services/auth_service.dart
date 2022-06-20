import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with ChangeNotifier {
  var currentUser;
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthService() {
    print("new AuthService");
  }

  Future getUser() {
    return Future.value(currentUser);
  }

  // wrappinhg the firebase calls
  Future logout() {
    this.currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  // wrapping the firebase calls
  Future createUser(
      {required String firstName,
        required String lastName,
        required String email,
        required String password}) async {}

  // logs in the user if password matches
  Future<User> loginUser(String email, String password) async {
    UserCredential result =
    await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;

    return user;
  }

  // logs in the user through google
  Future<UserCredential> signInWithGoogle() async {

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) async {
      if (user == null) {
        print('User is currently signed out!');

        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        return Future.value(await FirebaseAuth.instance.signInWithCredential(credential));

      } else {
        print('User is signed in!');
      }
    });

    return Future.value(null);
  }
}