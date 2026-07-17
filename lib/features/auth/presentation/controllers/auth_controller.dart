import 'package:flutter_chat/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_chat/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return AuthState.initial();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();

    final result = await ref
        .read(signUpUseCaseProvider)
        .call(name: name, email: email, password: password);

    state = result.fold(
      (isOk) => _registerState(isOk),
      (failure) => AuthState.error(failure.message),
    );
  }

  AuthState _registerState(bool isOk) {
    if (isOk) {
      return AuthState.created(isOk);
    }
    return AuthState.error('Erro inesperado!');
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();

    final result = await ref
        .read(signInUseCaseProvider)
        .call(SignInParameters(email: email, password: password));

    state = result.fold(
      (user) => AuthState.logged(user),
      (failure) => AuthState.error(failure.message),
    );
  }
}
