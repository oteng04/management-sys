import 'package:animated_login/animated_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:management_app/models/user.dart';

import 'dialog_builders.dart';

class LoginFunctions {
  /// Collection of functions will be performed on login/signup.
  /// * e.g. [onLogin], [onSignup], [socialLogin], and [onForgotPassword]
  const LoginFunctions(this.context);
  final BuildContext context;

  /// Login action that will be performed on click to action button in login mode.
  Future<List?> onLogin(LoginData loginData) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: loginData.email.trim().toLowerCase(), password: loginData.password);
      print('Signed in: ${result.user?.uid}');
      String uuid  = result.user!.uid;
      try {

        var userData = await FirebaseFirestore.instance.collection('users').doc(uuid).withConverter<UserMain>(
          fromFirestore: (snapshot, _) => UserMain.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),).get();
        // )
        //     .snapshots(
        //   includeMetadataChanges: true,
        // );
        return ['success', userData];
      } catch (e) {

        print('Signed in Error: $e');
        return  ['Something went wrong'];
      }
    }on FirebaseAuthException catch (e) {
      print('Signed up Error: $e');
      return  [e.message];
    }
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    if (signupData.password != signupData.confirmPassword) {
      return 'The passwords you entered do not match, check again.';
    }
    try {
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: signupData.email.trim().toLowerCase(), password: signupData.password);
      print('Signed up: ${result.user?.uid}');
      String uuid  = result.user!.uid;
      try {

        UserMain user = new UserMain(uuid: uuid, username: signupData.name, surname: '', firstname: '', othername: '', sex: '', role: '', dob: DateTime.now(), pic: '');
        await FirebaseFirestore.instance.collection('users')
            .doc(result.user?.uid).set(user.toJson());

        // fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
        // toFirestore: (movie, _) => movie.toJson(),
        return 'success';
      }catch (e) {

        print('Signed in Error: $e');
        return  'Something went wrong';
      }

    }on FirebaseAuthException catch (e) {
      // print('Error: $e');
      return  e.message;
    }

  }

  Stream<UserMain?> currentUserData(uuid) {
    return FirebaseFirestore.instance.collection('users').doc(uuid).snapshots()
        .map((DocumentSnapshot<Map<String, dynamic>> snapshot) => UserMain.fromJson(snapshot.data()!));
  }


}


class Errors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return "This e-mail address is already in use, please use a different e-mail address.";

      case 'ERROR_INVALID_EMAIL':
        return "The email address is badly formatted.";

      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return "The e-mail address in your Facebook account has been registered in the system before. Please login by trying other methods with this e-mail address.";

      case 'ERROR_WRONG_PASSWORD':
        return "E-mail address or password is incorrect.";

      default:
        return "An error has occurred";
    }
  }
}