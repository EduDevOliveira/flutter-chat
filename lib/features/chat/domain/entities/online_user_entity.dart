import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_user_entity.freezed.dart';

@freezed
abstract class OnlineUserEntity with _$OnlineUserEntity {
  const factory OnlineUserEntity({
    required String id,
    required String name,
    required bool online,
    required bool away,
  }) = _OnlineUserEntity;
}