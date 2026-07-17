import 'package:flutter_chat/core/errors/exceptions/app_exception.dart';
import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/core/errors/failures/failure_mapper.dart';
import 'package:flutter_chat/features/auth/data/datasources/auth_remote.dart';
import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemote _remote;

  AuthRepository({required this._remote});

  @override
  Stream<UserEntity?> authStateChanges() {
    return _remote.authStateChanges();
  }

  @override
  Future<ResultDart<bool, AppFailure>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _remote.signUp(
        name: name,
        email: email,
        password: password,
      );

      return Success(true);
    } on AppException catch (e) {
      return Failure(FailureMapper.map(e));
    }
  }

  @override
  Future<ResultDart<UserEntity, AppFailure>> signIn({
    required SignInParameters params,
  }) async {
    try {
      final result = await _remote.signIn(params: params);
      return Success(result!);
    } on AppException catch (e) {
      return Failure(FailureMapper.map(e));
    }
  }

  @override
  Future<void> setOffline() async {
    await _remote.setOffline();
  }

  @override
  Future<void> setOnline() async {
    await _remote.setOnline();
  }
}
