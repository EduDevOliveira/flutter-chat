// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onlineUsersRemote)
final onlineUsersRemoteProvider = OnlineUsersRemoteProvider._();

final class OnlineUsersRemoteProvider
    extends
        $FunctionalProvider<
          IOnlineUsersRemote,
          IOnlineUsersRemote,
          IOnlineUsersRemote
        >
    with $Provider<IOnlineUsersRemote> {
  OnlineUsersRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onlineUsersRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onlineUsersRemoteHash();

  @$internal
  @override
  $ProviderElement<IOnlineUsersRemote> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IOnlineUsersRemote create(Ref ref) {
    return onlineUsersRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IOnlineUsersRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IOnlineUsersRemote>(value),
    );
  }
}

String _$onlineUsersRemoteHash() => r'140ccdb68c51ac8348b8073a7f35ae267e32dd37';

@ProviderFor(onlineUsersRepository)
final onlineUsersRepositoryProvider = OnlineUsersRepositoryProvider._();

final class OnlineUsersRepositoryProvider
    extends
        $FunctionalProvider<
          IOnlineUsersRepository,
          IOnlineUsersRepository,
          IOnlineUsersRepository
        >
    with $Provider<IOnlineUsersRepository> {
  OnlineUsersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onlineUsersRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onlineUsersRepositoryHash();

  @$internal
  @override
  $ProviderElement<IOnlineUsersRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IOnlineUsersRepository create(Ref ref) {
    return onlineUsersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IOnlineUsersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IOnlineUsersRepository>(value),
    );
  }
}

String _$onlineUsersRepositoryHash() =>
    r'a79c8af3487e970234a8f09ee9e5a750978e7dbf';

@ProviderFor(getOnlineUsersUseCase)
final getOnlineUsersUseCaseProvider = GetOnlineUsersUseCaseProvider._();

final class GetOnlineUsersUseCaseProvider
    extends
        $FunctionalProvider<
          GetOnlineUsersUseCase,
          GetOnlineUsersUseCase,
          GetOnlineUsersUseCase
        >
    with $Provider<GetOnlineUsersUseCase> {
  GetOnlineUsersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getOnlineUsersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getOnlineUsersUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetOnlineUsersUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetOnlineUsersUseCase create(Ref ref) {
    return getOnlineUsersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetOnlineUsersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetOnlineUsersUseCase>(value),
    );
  }
}

String _$getOnlineUsersUseCaseHash() =>
    r'054649fadec783ab0f98d7026662714fe80be46b';
