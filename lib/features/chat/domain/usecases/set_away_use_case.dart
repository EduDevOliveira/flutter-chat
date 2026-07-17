import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';

class SetAwayUseCase {
  final IAuthRepository _repository;

  SetAwayUseCase({required this._repository});

  Future<void> call({required bool status}) async {
    return await _repository.setAway(status: status);
  }
}
