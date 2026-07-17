import 'package:flutter_chat/features/chat/domain/repositories/i_chat_repository.dart';

class SendMessageUseCase {
  final IChatRepository _repository;

  const SendMessageUseCase({required this._repository});

  Future<void> call(String message) async {
    return await _repository.sendMessage(message: message);
  }
}
