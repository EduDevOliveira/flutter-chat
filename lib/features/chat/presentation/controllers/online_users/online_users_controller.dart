import 'dart:async';

import 'package:flutter_chat/features/chat/domain/entities/online_user_entity.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/online_users/online_users_provider.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/online_users/online_users_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_users_controller.g.dart';

@riverpod
class OnlineUsersController extends _$OnlineUsersController {
  StreamSubscription<List<OnlineUserEntity>>? _subscription;

  @override
  OnlineUsersState build() {
    ref.onDispose(() => _subscription?.cancel());

    _listen();

    return const OnlineUsersState.initial();
  }

  void _listen() {
    state = const OnlineUsersState.loading();

    _subscription = ref
        .read(getOnlineUsersUseCaseProvider)
        .call()
        .listen(
          (users) {
            state = OnlineUsersState.loaded(users);
          },
          onError: (error) {
            state = OnlineUsersState.error(error.toString());
          },
        );
  }

  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
  }
}
