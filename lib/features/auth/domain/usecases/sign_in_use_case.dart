import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:result_dart/result_dart.dart';

part 'sign_in_use_case.g.dart';
part 'sign_in_use_case.freezed.dart';

class SignInUseCase {
  final IAuthRepository _repository;

  SignInUseCase({required this._repository});

  Future<ResultDart<UserEntity, AppFailure>> call(SignInParameters params) async {
    return await _repository.signIn(params: params);
  }
}

@freezed
abstract class SignInParameters with _$SignInParameters {
  const factory SignInParameters({
    required String email,
    required String password,
  }) = _SignInParameters;

  factory SignInParameters.fromJson(Map<String, Object?> json) =>
      _$SignInParametersFromJson(json);
}
