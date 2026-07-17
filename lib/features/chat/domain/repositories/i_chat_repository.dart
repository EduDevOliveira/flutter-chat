import 'package:flutter_chat/features/chat/domain/entities/message_entity.dart';

abstract class IChatRepository {
  Stream<List<MessageEntity>> getMessages();

  Future<void> sendMessage({required String message});

  Future<void> logout();
}
