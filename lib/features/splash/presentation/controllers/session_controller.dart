import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_controller.g.dart';

@riverpod
class SessionController extends _$SessionController {
  @override
  Stream<UserEntity?> build() {
    return ref.watch(authStateUseCaseProvider).call();
  }

  Future<void> setOnline() {
    return ref.read(authRepositoryProvider).setOnline();
  }

  Future<void> setOffline() {
    return ref.read(authRepositoryProvider).setOffline();
  }
}
