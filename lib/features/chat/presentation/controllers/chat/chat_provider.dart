import 'package:flutter_chat/core/providers/firebase_providers.dart';
import 'package:flutter_chat/features/chat/data/datasources/chat_remote.dart';
import 'package:flutter_chat/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_chat/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:flutter_chat/features/chat/domain/usecases/get_messages_use_case.dart';
import 'package:flutter_chat/features/chat/domain/usecases/logout_use_case.dart';
import 'package:flutter_chat/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_provider.g.dart';

@riverpod
IChatRemote chatRemote(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firebaseStoreProvider);
  return ChatRemote(auth: firebaseAuth, firestore: firestore);
}

@riverpod
IChatRepository chatRepository(Ref ref) {
  final remote = ref.watch(chatRemoteProvider);
  return ChatRepository(remote: remote);
}

@riverpod
GetMessagesUseCase getMessagesUseCase(Ref ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return GetMessagesUseCase(repository: repository);
}

@riverpod
SendMessageUseCase sendMessageUseCase(Ref ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return SendMessageUseCase(repository: repository);
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return LogoutUseCase(repository: repository);
}
