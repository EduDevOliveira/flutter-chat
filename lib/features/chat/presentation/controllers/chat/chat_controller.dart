import 'dart:async';
import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/features/chat/domain/entities/message_entity.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/chat/chat_provider.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/chat/chat_state.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/online_users/online_users_controller.dart';
import 'package:flutter_chat/features/splash/presentation/controllers/session_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  StreamSubscription<List<MessageEntity>>? _subscription;

  @override
  ChatState build() {
    final session = ref.watch(sessionControllerProvider);

    if (session.value == null) {
      return const ChatState.initial();
    }

    _listenMessages();

    ref.onDispose(() {
      _subscription?.cancel();
    });

    return const ChatState.initial();
  }

  void _listenMessages() {
    state = const Loading();

    _subscription = ref
        .read(getMessagesUseCaseProvider)
        .call()
        .listen(
          (messages) {
            state = Loaded(messages);
          },
          onError: (error) {
            if (error is AppFailure) {
              state = Error(error.message);
              return;
            }
            state = Error(error.toString());
          },
        );
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    try {
      await ref
          .read(sendMessageUseCaseProvider)
          .call(
            message.trim(),
          );
    } catch (e) {
      state = Error(e.toString());
    }
  }

  Future<void> logout() async {
    state = const Loading();

    await ref.read(logoutUseCaseProvider).call();

    state = const Logout();

    ref.read(chatControllerProvider.notifier).stopListening();
    ref.read(onlineUsersControllerProvider.notifier).stopListening();
  }

  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
  }
}
