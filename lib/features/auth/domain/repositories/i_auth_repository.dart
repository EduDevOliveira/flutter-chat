import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class IAuthRepository {
  Stream<UserEntity?> authStateChanges();

  Future<ResultDart<UserEntity, AppFailure>> signIn({
    required SignInParameters params,
  });

  Future<ResultDart<bool, AppFailure>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> setOnline();

  Future<void> setOffline();
}
