import 'package:flutter_chat/features/chat/domain/entities/online_user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_users_state.freezed.dart';

@freezed
class OnlineUsersState with _$OnlineUsersState {
  const factory OnlineUsersState.initial() = Initial;
  const factory OnlineUsersState.loading() = Loading;
  const factory OnlineUsersState.loaded(List<OnlineUserEntity> users) = Loaded;
  const factory OnlineUsersState.error(String message) = Error;
}
