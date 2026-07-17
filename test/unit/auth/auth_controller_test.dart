import 'package:flutter_chat/core/errors/failures/app_failure.dart';
import 'package:flutter_chat/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:flutter_chat/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_chat/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------
class MockSignUpUseCase extends Mock implements SignUpUseCase {}

class MockSignInUseCase extends Mock implements SignInUseCase {}

class FakeSignInParameters extends Fake implements SignInParameters {}

void main() {
  late MockSignUpUseCase mockSignUpUseCase;
  late MockSignInUseCase mockSignInUseCase;
  late ProviderContainer container;

  const tName = 'John Doe';
  const tEmail = 'john@doe.com';
  const tPassword = '123456';
  final tUser = UserEntity(
    id: '1',
    name: tName,
    email: tEmail,
    online: true,
    away: false,
    lastSeen: DateTime.now(),
  );
  const tFailureMessage = 'Algo deu errado';

  setUpAll(() {
    registerFallbackValue(FakeSignInParameters());
  });

  setUp(() {
    mockSignUpUseCase = MockSignUpUseCase();
    mockSignInUseCase = MockSignInUseCase();

    container = ProviderContainer(
      overrides: [
        signUpUseCaseProvider.overrideWithValue(mockSignUpUseCase),
        signInUseCaseProvider.overrideWithValue(mockSignInUseCase),
      ],
    );

    addTearDown(container.dispose);
  });

  AuthController readController() =>
      container.read(authControllerProvider.notifier);
  AuthState readState() => container.read(authControllerProvider);

  group('AuthController - build', () {
    test('estado inicial deve ser AuthState.initial()', () {
      expect(readState(), const AuthState.initial());
    });
  });

  group('AuthController - register', () {
    test(
      'deve emitir [loading, created(true)] quando o cadastro tem sucesso',
      () async {
        // arrange
        when(
          () => mockSignUpUseCase.call(
            name: tName,
            email: tEmail,
            password: tPassword,
          ),
        ).thenAnswer((_) async => Success(true));

        final emittedStates = <AuthState>[];
        container.listen(
          authControllerProvider,
          (previous, next) => emittedStates.add(next),
          fireImmediately: false,
        );

        // act
        await readController().register(
          name: tName,
          email: tEmail,
          password: tPassword,
        );

        // assert
        expect(emittedStates, [
          const AuthState.loading(),
          const AuthState.created(true),
        ]);
        verify(
          () => mockSignUpUseCase.call(
            name: tName,
            email: tEmail,
            password: tPassword,
          ),
        ).called(1);
      },
    );

    test(
      'deve emitir [loading, error("Erro inesperado!")] quando isOk é false',
      () async {
        // arrange
        when(
          () => mockSignUpUseCase.call(
            name: tName,
            email: tEmail,
            password: tPassword,
          ),
        ).thenAnswer((_) async => const Success(false));

        final emittedStates = <AuthState>[];
        container.listen(
          authControllerProvider,
          (previous, next) => emittedStates.add(next),
        );

        // act
        await readController().register(
          name: tName,
          email: tEmail,
          password: tPassword,
        );

        // assert
        expect(emittedStates, [
          const AuthState.loading(),
          const AuthState.error('Erro inesperado!'),
        ]);
      },
    );

    test(
      'deve emitir [loading, error(failure.message)] quando o use case retorna falha',
      () async {
        // arrange
        when(
          () => mockSignUpUseCase.call(
            name: tName,
            email: tEmail,
            password: tPassword,
          ),
        ).thenAnswer(
          (_) async => const Failure(AppFailure.auth(tFailureMessage)),
        );

        final emittedStates = <AuthState>[];
        container.listen(
          authControllerProvider,
          (previous, next) => emittedStates.add(next),
        );

        // act
        await readController().register(
          name: tName,
          email: tEmail,
          password: tPassword,
        );

        // assert
        expect(emittedStates, [
          const AuthState.loading(),
          const AuthState.error(tFailureMessage),
        ]);
      },
    );
  });

  group('AuthController - login', () {
    test(
      'deve emitir [loading, logged(user)] quando o login tem sucesso',
      () async {
        // arrange
        when(
          () => mockSignInUseCase.call(any()),
        ).thenAnswer((_) async => Success(tUser));

        final emittedStates = <AuthState>[];
        container.listen(
          authControllerProvider,
          (previous, next) => emittedStates.add(next),
        );

        // act
        await readController().login(email: tEmail, password: tPassword);

        // assert
        expect(emittedStates, [
          const AuthState.loading(),
          AuthState.logged(tUser),
        ]);

        final captured = verify(
          () => mockSignInUseCase.call(captureAny()),
        ).captured;
        final params = captured.first as SignInParameters;
        expect(params.email, tEmail);
        expect(params.password, tPassword);
      },
    );

    test(
      'deve emitir [loading, error(failure.message)] quando o login falha',
      () async {
        // arrange
        when(
          () => mockSignInUseCase.call(any()),
        ).thenAnswer(
          (_) async => const Failure(AppFailure.auth(tFailureMessage)),
        );

        final emittedStates = <AuthState>[];
        container.listen(
          authControllerProvider,
          (previous, next) => emittedStates.add(next),
        );

        // act
        await readController().login(email: tEmail, password: tPassword);

        // assert
        expect(emittedStates, [
          const AuthState.loading(),
          const AuthState.error(tFailureMessage),
        ]);
      },
    );
  });
}
