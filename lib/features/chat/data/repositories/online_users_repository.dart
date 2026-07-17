import 'package:flutter_chat/features/chat/data/datasources/online_users_remote.dart';
import 'package:flutter_chat/features/chat/domain/entities/online_user_entity.dart';
import 'package:flutter_chat/features/chat/domain/repositories/i_online_users_repository.dart';

class OnlineUsersRepository implements IOnlineUsersRepository {
  final IOnlineUsersRemote _remote;

  OnlineUsersRepository({required this._remote});

  @override
  Stream<List<OnlineUserEntity>> getOnlineUsers() {
    return _remote.getOnlineUsers();
  }
}
