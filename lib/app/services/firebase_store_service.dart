// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_chat/features/auth/data/models/user_model.dart';

// class FirebaseStoreService {
//   final FirebaseFirestore _firestore;

//   FirebaseStoreService({required this._firestore});

//   Future<void> createUser(UserModel user) async {
//     try {
//       await _firestore.collection('users').doc(user.id).set({
//         'name': user.name,
//         'email': user.email,
//         'online': true,
//         'lastSeen': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       throw Exception();
//     }
//   }

//   Future<void> updateStatus({
//     required String userId,
//     required bool status,
//   }) async {
//     try {
//       final doc = await _firestore.collection('users').doc(userId).get();

//       if(doc.exists){
//         await _firestore.collection('users').doc(userId).update({
//           'online': status,
//         });
//       }
      
//     } catch (e) {}
//   }
// }
