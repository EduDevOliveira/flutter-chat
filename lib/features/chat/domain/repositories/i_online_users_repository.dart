import 'package:flutter_chat/features/chat/domain/entities/online_user_entity.dart';

abstract interface class IOnlineUsersRepository {
  Stream<List<OnlineUserEntity>> getOnlineUsers();

  Future<void> sendMessage({
    required String message,
  });
}
