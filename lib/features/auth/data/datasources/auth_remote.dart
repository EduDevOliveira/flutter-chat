import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/core/errors/exceptions/app_exception.dart';
import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_in_use_case.dart';

abstract interface class IAuthRemote {
  Future<UserEntity?> signIn({
    required SignInParameters params,
  });

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  });

  Stream<UserEntity?> authStateChanges();

  Future<void> setOnline();

  Future<void> setOffline();
}

class AuthRemote implements IAuthRemote {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemote({
    required this._firebaseAuth,
    required this._firestore,
  });

  @override
  Stream<UserEntity?> authStateChanges() {
    return _firebaseAuth.authStateChanges().asyncMap(
      (user) async {
        if (user == null) return null;

        final document = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();

        if (document.data() == null) return null;

        return UserEntity(
          id: user.uid,
          email: document['email'],
          name: document['name'],
          online: document['online'],
          lastSeen: (document['lastSeen'] as Timestamp).toDate(),
        );
      },
    );
  }

  @override
  Future<UserEntity?> signIn({required SignInParameters params}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      User? user = userCredential.user;

      if (user == null) return null;

      await setOnline();

      final document = await _firestore.collection('users').doc(user.uid).get();

      if (document.data() == null) return null;

      return UserEntity(
        id: user.uid,
        email: document['email'],
        name: document['name'],
        online: document['online'],
        lastSeen: (document['lastSeen'] as Timestamp).toDate(),
      );
    } on FirebaseAuthException catch (e) {
      throw AppException.auth(e.code);
    } on FirebaseException catch (e) {
      throw AppException.firestore(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }

  @override
  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user == null) return false;

      await user.updateDisplayName(name);

      await user.reload();

      final userModel = UserEntity(
        id: user.uid,
        name: name,
        email: email,
        online: true,
      );

      await createUser(userModel);

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      throw AppException.auth(e.code);
    } on FirebaseException catch (e) {
      throw AppException.firestore(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }

  Future<void> createUser(UserEntity user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'online': true,
        'lastSeen': FieldValue.serverTimestamp(),
      });
    } on FirebaseAuthException catch (e) {
      throw AppException.auth(e.code);
    } on FirebaseException catch (e) {
      throw AppException.firestore(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }

  @override
  Future<void> setOffline() async {
    try {
      final uid = _firebaseAuth.currentUser?.uid;

      if (uid == null) return;

      await _firestore.collection('users').doc(uid).update({
        'online': false,
        'lastSeen': FieldValue.serverTimestamp(),
      });
    } on FirebaseAuthException catch (e) {
      throw AppException.auth(e.code);
    } on FirebaseException catch (e) {
      throw AppException.firestore(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }

  @override
  Future<void> setOnline() async {
    try {
      final uid = _firebaseAuth.currentUser?.uid;

      if (uid == null) return;

      await _firestore.collection('users').doc(uid).update({
        'online': true,
        'lastSeen': FieldValue.serverTimestamp(),
      });
    } on FirebaseAuthException catch (e) {
      throw AppException.auth(e.code);
    } on FirebaseException catch (e) {
      throw AppException.firestore(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }
}
