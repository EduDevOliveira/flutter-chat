// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_chat/app/services/firebase_store_service.dart';
// import 'package:flutter_chat/features/auth/data/models/user_model.dart';

// class FirebaseAuthService {
//   final FirebaseAuth firebaseAuth;
//   final FirebaseStoreService firestore;

//   FirebaseAuthService({
//     required this.firebaseAuth,
//     required this.firestore,
//   });

//   Stream<User?> authStateChanges() {
//     // TODO: implement authStateChanges
//     throw UnimplementedError();
//   }

//   Future<User?> currentUser() {
//     // TODO: implement currentUser
//     throw UnimplementedError();
//   }

//   Future<UserModel> signIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = userCredentials.user;

//       if (user != null) {
//         await firestore.updateStatus(userId: user.uid, status: true);
//         //pega os dados do usuario
//       }

//       return UserModel(
//         id: '',
//         name: '',
//         email: '',
//         online: true,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//       throw Exception();
//     } catch (e) {
//       throw Exception();
//     }
//   }

//   Future<bool> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = userCredential.user;

//       if (user != null) {
//         await user.updateDisplayName(name);

//         await user.reload();

//         final userModel = UserModel(
//           id: user.uid,
//           name: name,
//           email: email,
//           online: true,
//         );

//         await firestore.createUser(userModel);
//       }

//       return userCredential.user != null;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//       throw Exception();
//     } catch (e) {
//       throw Exception();
//     }
//   }

//   Future<void> signOut() async {
//     final currentUser = firebaseAuth.currentUser;
//     try {
//       if (currentUser != null) {
//         //atualiza status para offline
//       }
//       await firebaseAuth.signOut();
//     } catch (e) {
//       throw Exception();
//     }
//   }
// }
