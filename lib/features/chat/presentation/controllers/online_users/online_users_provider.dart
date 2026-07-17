import 'package:flutter_chat/core/providers/firebase_providers.dart';
import 'package:flutter_chat/features/chat/data/datasources/online_users_remote.dart';
import 'package:flutter_chat/features/chat/data/repositories/online_users_repository.dart';
import 'package:flutter_chat/features/chat/domain/repositories/i_online_users_repository.dart';
import 'package:flutter_chat/features/chat/domain/usecases/getonline_users_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_users_provider.g.dart';

@riverpod
IOnlineUsersRemote onlineUsersRemote(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firebaseStoreProvider);
  return OnlineUsersRemote(firebaseAuth: firebaseAuth, firestore: firestore);
}

@riverpod
IOnlineUsersRepository onlineUsersRepository(Ref ref) {
  final remote = ref.watch(onlineUsersRemoteProvider);
  return OnlineUsersRepository(remote: remote);
}

@riverpod
GetOnlineUsersUseCase getOnlineUsersUseCase(Ref ref) {
  final repository = ref.watch(onlineUsersRepositoryProvider);
  return GetOnlineUsersUseCase(repository: repository);
}
