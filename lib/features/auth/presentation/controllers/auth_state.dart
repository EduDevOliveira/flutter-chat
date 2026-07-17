import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.logged(UserEntity user) = Logged;
  const factory AuthState.created(bool isOk) = Created;
  const factory AuthState.error(String message) = Error;
}
