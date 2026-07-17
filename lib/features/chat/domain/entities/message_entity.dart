import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

@freezed
abstract class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String id,
    required String senderId,
    required String senderName,
    required String message,
    required DateTime createdAt,
  }) = _MessageEntity;
}
