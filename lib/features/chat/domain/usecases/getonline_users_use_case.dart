import 'package:flutter_chat/features/chat/domain/entities/online_user_entity.dart';
import 'package:flutter_chat/features/chat/domain/repositories/i_online_users_repository.dart';

class GetOnlineUsersUseCase {
  final IOnlineUsersRepository _repository;

  const GetOnlineUsersUseCase({required this._repository});

  Stream<List<OnlineUserEntity>> call() {
    return _repository.getOnlineUsers();
  }
}
