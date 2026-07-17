import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';

class SetOfflineUseCase {
  final IAuthRepository _repository;

  SetOfflineUseCase({required this._repository});

  Future<void> call() async {
  return await _repository.setOffline();
  }
}
