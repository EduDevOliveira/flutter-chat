import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/features/chat/domain/entities/online_user_entity.dart';

abstract interface class IOnlineUsersRemote {
  Stream<List<OnlineUserEntity>> getOnlineUsers();
}

class OnlineUsersRemote implements IOnlineUsersRemote {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  OnlineUsersRemote({required this._firestore, required this._firebaseAuth});

  @override
  Stream<List<OnlineUserEntity>> getOnlineUsers() {
    return _firestore
        .collection('users')
        .where('online', isEqualTo: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .where((doc) => doc.id != _firebaseAuth.currentUser?.uid)
              .map(
                (data) {
                  return OnlineUserEntity(
                    id: data.id,
                    name: data['name'],
                    online: data['online'],
                    away: data['away'],
                  );
                },
              )
              .toList(),
        );
  }
}
