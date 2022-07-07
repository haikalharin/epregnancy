import 'dart:developer';

import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/constants/router_constants.dart';
import '../model/person_model/person_model.dart';
import '../shared_preference/app_shared_preference.dart';
import 'event/event_person_example.dart';
import 'firebase_options.dart';

class GAuthentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        log(e.toString());
      }
    } else {
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn();

        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          try {
            final UserCredential userCredential =
                await auth.signInWithCredential(credential);

            user = userCredential.user;
          } on FirebaseAuthException catch (e) {
            if (e.code == 'account-exists-with-different-credential') {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     GAuthentication.customSnackBar(
              //       content:
              //           'The account already exists with a different credential',
              //     ),
              //   );
            } else if (e.code == 'invalid-credential') {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   GAuthentication.customSnackBar(
              //     content:
              //         'Error occurred while accessing credentials. Try again.',
              //   ),
              // );
            }
          } catch (e) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   GAuthentication.customSnackBar(
            //     content: 'Error occurred using Google Sign In. Try again.',
            //   ),
            // );
          }
        }
      } catch (e) {
        log(e.toString());
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        GAuthentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  static Future<void> signinWithNumerPhone(
      {required BuildContext context,
      required TextEditingController codeController, required String phoneNumber}) async {
    bool? status = false;
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
     String phoneNumberFix = phoneNumber.replaceFirst("0", "+62");
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumberFix,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // ANDROID ONLY!

            // Sign the user in (or link) with the auto-generated credential
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException error) {
            print(error);
          },
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-resolution timed out...
          },
          codeSent: (String verificationId, int? forceResendingToken) async {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Give the code?"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: codeController,
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Confirm"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          final code = codeController.text.trim();
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: code);
                          await _auth.signInWithCredential(credential);

                          if (_auth.currentUser != null) {
                            PersonModel person = PersonModel(
                              phoneNumber: phoneNumberFix,
                              name: _auth.currentUser!.displayName??"",
                              photo: _auth.currentUser!.photoURL??"",
                              token: '',
                              uid: _auth.currentUser!.uid,
                            );
                            EventPersonExample.addPerson(person);
                            await AppSharedPreference.setPerson(person);
                            Navigator.of(context)
                                .pushNamed(RouteName.dashboard);
                          } else {
                            print("Error");
                          }
                        },
                      )
                    ],
                  );
                });

            // Create a PhoneAuthCredential with the code

            // Sign the user in (or link) with the credential
          });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        GAuthentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}
