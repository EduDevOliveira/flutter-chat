import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';

class AuthStateUseCase {
  final IAuthRepository _repository;

  AuthStateUseCase({required this._repository});

  Stream<UserEntity?> call() {
    return _repository.authStateChanges();
  }
}
