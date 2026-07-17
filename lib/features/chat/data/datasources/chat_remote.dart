import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/core/errors/exceptions/app_exception.dart';
import 'package:flutter_chat/features/chat/domain/entities/message_entity.dart';

abstract interface class IChatRemote {
  Stream<List<MessageEntity>> messages();

  Future<void> send({required String message});

  Future<void> logout();
}

class ChatRemote implements IChatRemote {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ChatRemote({required this._firestore, required this._auth});

  @override
  Stream<List<MessageEntity>> messages() {
    if (_auth.currentUser == null) {
      return const Stream.empty();
    }

    return _messagesCollection
        .orderBy('createdAt')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList())
        .handleError(_mapFirestoreError);
  }

  CollectionReference<MessageEntity> get _messagesCollection {
    return _firestore
        .collection('messages')
        .withConverter<MessageEntity>(
          fromFirestore: MessageEntity.fromFirestore,
          toFirestore: (message, _) => message.toFirestore(),
        );
  }

  void _mapFirestoreError(Object error) {
    if (error is FirebaseException) {
      throw AppException.firestore(error.code);
    }
    if (error is SocketException) {
      throw const AppException.network();
    }
    throw AppException.unknown(error.toString());
  }

  @override
  Future<void> send({required String message}) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não autenticado.');
    }

    final userDoc = await _getUser(user);

    final data = userDoc.data();

    if (data == null) {
      throw AppException.unknown('Usuário não encontrado.');
    }

    await _sendMessage(user: user, name: data['name'], message: message);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUser(User user) async {
    try {
      return await _firestore.collection('users').doc(user.uid).get();
    } on FirebaseException catch (e) {
      throw AppException.auth(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }

  Future<void> _sendMessage({
    required User user,
    required String name,
    required String message,
  }) async {
    try {
      await _firestore.collection('messages').add({
        'senderId': user.uid,
        'senderName': name,
        'message': message,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw AppException.auth(e.code);
    } on SocketException {
      throw const AppException.network();
    } catch (e) {
      throw AppException.unknown(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    if (_auth.currentUser == null) return;

    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'online': false,
      'lastSeen': FieldValue.serverTimestamp(),
    });

    await _auth.signOut();
  }
}
