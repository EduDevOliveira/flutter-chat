import 'package:flutter_chat/core/providers/firebase_providers.dart';
import 'package:flutter_chat/features/auth/data/datasources/auth_remote.dart';
import 'package:flutter_chat/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_chat/features/auth/domain/usecases/auth_state_use_case.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:flutter_chat/features/chat/domain/usecases/set_away_use_case.dart';
import 'package:flutter_chat/features/chat/domain/usecases/set_offline_use_case.dart';
import 'package:flutter_chat/features/chat/domain/usecases/set_online_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
IAuthRemote authRemote(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final fireStore = ref.watch(firebaseStoreProvider);
  return AuthRemote(firebaseAuth: firebaseAuth, firestore: fireStore);
}

@riverpod
IAuthRepository authRepository(Ref ref) {
  final remote = ref.watch(authRemoteProvider);
  return AuthRepository(remote: remote);
}

@riverpod
SignUpUseCase signUpUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository: repository);
}

@riverpod
SignInUseCase signInUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository: repository);
}

@riverpod
AuthStateUseCase authStateUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthStateUseCase(repository: repository);
}

@riverpod
SetOnlineUseCase setOnlineUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SetOnlineUseCase(repository: repository);
}

@riverpod
SetOfflineUseCase setOfflineUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SetOfflineUseCase(repository: repository);
}

@riverpod
SetAwayUseCase setAbsentUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SetAwayUseCase(repository: repository);
}
