import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:minecloud_tal/common/widgets/common_methods.dart';

class AuthService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn(clientId: '212576114202-cjhrerbh4qitnqjrde42mch1v18euj48.apps.googleusercontent.com');

  //     ======================= Google Sign In =======================     //
  static Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final credentials = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential authResult =
        await firebaseAuth.signInWithCredential(credentials);
        logs('Google --> ${authResult.user}');
        return authResult;
      }
      return null;
    } on FirebaseException catch (e) {
      logs('Catch error in signInWithGoogle : ${e.message}');
      return null;
    }
  }

  //     ======================= Email SignUp =======================     //
  static Future<UserCredential?> createUser(BuildContext context, String email, String password) async {
    try {
      UserCredential authUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      logs('Email --> ${authUser.user}');
      return authUser;
    } on FirebaseException catch (e) {
      logs('Catch error in Verify User --> ${e.message}');
      return null;
    }
  }

  //     ======================= Email SignIn =======================     //
  static Future<UserCredential?> verifyUser(BuildContext context, String email, String password) async {
    try {
      UserCredential authUser = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      logs('Email --> ${authUser.user}');
      return authUser;
    } on FirebaseException catch (e) {
      logs('Catch error in Verify User --> ${e.message}');
      return null;
    }
  }

  //     ======================= Forgot Password =======================     //
  static Future<void> forgotPassword(BuildContext context, [String? email]) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email!);
    } on FirebaseException catch (e) {
      logs('Catch error in Forgot Password --> ${e.message}');
    }
  }
}
