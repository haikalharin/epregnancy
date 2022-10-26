import 'package:PregnancyApp/data/repository/firebase_repository/firebase_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/exceptions/server_auth_error_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/failure/logIn_with_google_failure.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show kIsWeb, visibleForTesting;


class FirebaseRepositoryImpl extends FirebaseRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseRepositoryImpl(this.networkInfo, this.remoteDatasource, this._firebaseAuth, this._googleSignIn);


  @visibleForTesting
  bool isWeb = kIsWeb;

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider =firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthErrorException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code.toString());
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }



}