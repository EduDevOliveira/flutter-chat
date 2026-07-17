import 'package:flutter_chat/features/chat/domain/entities/message_entity.dart';
import 'package:flutter_chat/features/chat/domain/repositories/i_chat_repository.dart';

class GetMessagesUseCase {
  final IChatRepository _repository;

  const GetMessagesUseCase({required this._repository});

  Stream<List<MessageEntity>> call() {
    return _repository.getMessages();
  }
}
