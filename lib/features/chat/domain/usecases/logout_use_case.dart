import 'package:flutter_chat/features/chat/domain/repositories/i_chat_repository.dart';

class LogoutUseCase {
  final IChatRepository _repository;

  LogoutUseCase({required this._repository});

  Future<void> call() async {
    return await _repository.logout();
  }
}
