import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:result_dart/result_dart.dart';

class SignUpUseCase {
  final IAuthRepository _repository;

  const SignUpUseCase({required this._repository});

  Future<ResultDart<bool, AppFailure>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return _repository.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}
