import 'dart:developer';

import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/domain/source/firebase/auth_firebase_data_source.dart';
import 'package:breather_app/features/auth/domain/usecases/get_user_from_firestore_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:breather_app/utils/exceptions/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthFirebaseDataSource)
class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      User? user = result.user;

      if (user == null) {
        throw SomethingWentWrongException();
      }

      return LoginUsecaseOutput(
        user: UserModel(
          email: user.email!,
          name: user.displayName!,
          id: user.uid,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.message == 'user-not-found') {
        throw MessageException(message: "No user found with this email.");
      } else if (e.message == 'wrong-password') {
        throw MessageException(message: "Incorrect password.");
      } else if (e.message == 'invalid-email') {
        throw MessageException(message: "Invalid email address.");
      } else {
        throw MessageException(message: "Login failed: ${e.message}");
      }
    }
  }

  @override
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input) async {
    User? user;

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      if (result.user == null) {
        log('User registration failed..');
        throw SomethingWentWrongException();
      }

      user = result.user!;
      await user.updateDisplayName(input.name);
      await user.reload();
      user = _auth.currentUser!;

      log('User registered successfully..');
      log('Email: ${user.email}');
      log('Name: ${user.displayName}');

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
        {
          'id': user.uid,
          'email': user.email,
          'name': user.displayName,
          'streak': 0,
          'score': 0,
          'completedExercises': 0,
          'lastUpdated': '${user.metadata.creationTime}',
        },
      );

      return RegisterUsecaseOutput(
        user: UserModel(
          email: user.email!,
          name: user.displayName!,
          id: user.uid,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.message == 'email-already-in-use') {
        throw MessageException(message: "The email address is already in use.");
      } else if (e.message == 'invalid-email') {
        throw MessageException(message: "Invalid email address.");
      } else if (e.message == 'weak-password') {
        throw MessageException(message: "The password is too weak.");
      } else {
        throw MessageException(message: "Registration failed: ${e.message}");
      }
    }
  }

  @override
  Future<SignInWithGoogleUsecaseOutput> signInWithGoogle(
      SignInWithGoogleUsecaseInput input) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw Exception('Google sign-in aborted or failed.');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = UserModel(
        name: authResult.user!.displayName!,
        email: authResult.user!.email!,
        id: authResult.user!.uid,
      );

      return SignInWithGoogleUsecaseOutput(user: user);
    } on FirebaseException catch (e) {
      throw MessageException(message: e.message.toString());
    } catch (e) {
      log('Error ...$e');
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input) async {
    bool isSuccess = false;

    try {
      await _auth.sendPasswordResetEmail(
          email: input.email,
          actionCodeSettings:
              ActionCodeSettings(url: 'https://breatherapp.page.link'));
      isSuccess = true;
    } on FirebaseAuthException catch (e) {
      throw MessageException(message: e.message!);
    } catch (e) {
      throw SomethingWentWrongException();
    }
    return ResetPasswordUsecaseOutput(isSuccess: isSuccess);
  }

  @override
  Future<GetUserFromFirestoreUsecaseOutput> getUserFromFirestore(
      GetUserFromFirestoreUsecaseInput input) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot userSnapshot = await usersCollection.doc(input.id).get();

      if (userSnapshot.exists) {
        final user = UserModel.fromFirestore(userSnapshot);
        return GetUserFromFirestoreUsecaseOutput(user: user);
      } else {
        return GetUserFromFirestoreUsecaseOutput(user: null);
      }
    } catch (e) {
      debugPrint('Error getting user: $e');
    }

    return GetUserFromFirestoreUsecaseOutput(user: null);
  }
}
