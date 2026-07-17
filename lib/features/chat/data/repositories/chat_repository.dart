import 'package:flutter_chat/core/errors/exceptions/app_exception.dart';
import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/core/errors/failures/failure_mapper.dart';
import 'package:flutter_chat/features/chat/data/datasources/chat_remote.dart';
import 'package:flutter_chat/features/chat/domain/entities/message_entity.dart';
import 'package:flutter_chat/features/chat/domain/repositories/i_chat_repository.dart';

class ChatRepository implements IChatRepository {
  final IChatRemote _remote;

  ChatRepository({required this._remote});

  @override
  Stream<List<MessageEntity>> getMessages() {
    return _remote.messages().handleError((error) {
      if (error is AppException) {
        throw FailureMapper.map(error);
      }

      throw const UnknownFailure('');
    });
  }

  @override
  Future<void> sendMessage({required String message}) async {
    return await _remote.send(message: message);
  }

  @override
  Future<void> logout() async {
    return await _remote.logout();
  }
}
