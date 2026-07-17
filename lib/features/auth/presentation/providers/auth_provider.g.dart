// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemote)
final authRemoteProvider = AuthRemoteProvider._();

final class AuthRemoteProvider
    extends $FunctionalProvider<IAuthRemote, IAuthRemote, IAuthRemote>
    with $Provider<IAuthRemote> {
  AuthRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteHash();

  @$internal
  @override
  $ProviderElement<IAuthRemote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRemote create(Ref ref) {
    return authRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRemote>(value),
    );
  }
}

String _$authRemoteHash() => r'a990215c928f4816bd12454885ec49e5b6944a5a';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<IAuthRepository, IAuthRepository, IAuthRepository>
    with $Provider<IAuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'f8c3d078203360442f31fa930911f7c1052655e0';

@ProviderFor(signUpUseCase)
final signUpUseCaseProvider = SignUpUseCaseProvider._();

final class SignUpUseCaseProvider
    extends $FunctionalProvider<SignUpUseCase, SignUpUseCase, SignUpUseCase>
    with $Provider<SignUpUseCase> {
  SignUpUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignUpUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignUpUseCase create(Ref ref) {
    return signUpUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpUseCase>(value),
    );
  }
}

String _$signUpUseCaseHash() => r'f7b5d7fa0e18fd3b221569100368795847bd61ab';

@ProviderFor(signInUseCase)
final signInUseCaseProvider = SignInUseCaseProvider._();

final class SignInUseCaseProvider
    extends $FunctionalProvider<SignInUseCase, SignInUseCase, SignInUseCase>
    with $Provider<SignInUseCase> {
  SignInUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignInUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInUseCase create(Ref ref) {
    return signInUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInUseCase>(value),
    );
  }
}

String _$signInUseCaseHash() => r'739f9b9b78144dc12cefd50f4ebfa31ea8c36d19';

@ProviderFor(authStateUseCase)
final authStateUseCaseProvider = AuthStateUseCaseProvider._();

final class AuthStateUseCaseProvider
    extends
        $FunctionalProvider<
          AuthStateUseCase,
          AuthStateUseCase,
          AuthStateUseCase
        >
    with $Provider<AuthStateUseCase> {
  AuthStateUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateUseCaseHash();

  @$internal
  @override
  $ProviderElement<AuthStateUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthStateUseCase create(Ref ref) {
    return authStateUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthStateUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthStateUseCase>(value),
    );
  }
}

String _$authStateUseCaseHash() => r'153eb870a2cec7f3876d5fde4f61bf48ae1c1a10';
