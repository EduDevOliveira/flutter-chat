import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';

class SetOnlineUseCase {
  final IAuthRepository _repository;

  SetOnlineUseCase({required this._repository});

  Future<void> call() async {
  return await _repository.setOnline();
  }
}
