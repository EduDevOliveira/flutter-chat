import 'package:flutter_chat/features/chat/domain/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = Initial;
  const factory ChatState.loading() = Loading;
  const factory ChatState.logout() = Logout;
  const factory ChatState.loaded(List<MessageEntity> messages) = Loaded;
  const factory ChatState.error(String message) = Error;
}
