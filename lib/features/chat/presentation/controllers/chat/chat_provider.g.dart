// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatRemote)
final chatRemoteProvider = ChatRemoteProvider._();

final class ChatRemoteProvider
    extends $FunctionalProvider<IChatRemote, IChatRemote, IChatRemote>
    with $Provider<IChatRemote> {
  ChatRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRemoteHash();

  @$internal
  @override
  $ProviderElement<IChatRemote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IChatRemote create(Ref ref) {
    return chatRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IChatRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IChatRemote>(value),
    );
  }
}

String _$chatRemoteHash() => r'85fc3808ad7ecd17b6417d57a67cb7274d15e174';

@ProviderFor(chatRepository)
final chatRepositoryProvider = ChatRepositoryProvider._();

final class ChatRepositoryProvider
    extends
        $FunctionalProvider<IChatRepository, IChatRepository, IChatRepository>
    with $Provider<IChatRepository> {
  ChatRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryHash();

  @$internal
  @override
  $ProviderElement<IChatRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IChatRepository create(Ref ref) {
    return chatRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IChatRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IChatRepository>(value),
    );
  }
}

String _$chatRepositoryHash() => r'7cd35bc86ea224f22baf7a10ef42ffa4a311c01c';

@ProviderFor(getMessagesUseCase)
final getMessagesUseCaseProvider = GetMessagesUseCaseProvider._();

final class GetMessagesUseCaseProvider
    extends
        $FunctionalProvider<
          GetMessagesUseCase,
          GetMessagesUseCase,
          GetMessagesUseCase
        >
    with $Provider<GetMessagesUseCase> {
  GetMessagesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMessagesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMessagesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMessagesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMessagesUseCase create(Ref ref) {
    return getMessagesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMessagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMessagesUseCase>(value),
    );
  }
}

String _$getMessagesUseCaseHash() =>
    r'e102b6a74f13b729a5fbcfe594f1ed012283a31c';

@ProviderFor(sendMessageUseCase)
final sendMessageUseCaseProvider = SendMessageUseCaseProvider._();

final class SendMessageUseCaseProvider
    extends
        $FunctionalProvider<
          SendMessageUseCase,
          SendMessageUseCase,
          SendMessageUseCase
        >
    with $Provider<SendMessageUseCase> {
  SendMessageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendMessageUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendMessageUseCaseHash();

  @$internal
  @override
  $ProviderElement<SendMessageUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SendMessageUseCase create(Ref ref) {
    return sendMessageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendMessageUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendMessageUseCase>(value),
    );
  }
}

String _$sendMessageUseCaseHash() =>
    r'b797b07aa7e6f1a9c9696c8953a8a7ef5c037819';

@ProviderFor(logoutUseCase)
final logoutUseCaseProvider = LogoutUseCaseProvider._();

final class LogoutUseCaseProvider
    extends $FunctionalProvider<LogoutUseCase, LogoutUseCase, LogoutUseCase>
    with $Provider<LogoutUseCase> {
  LogoutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUseCaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUseCase create(Ref ref) {
    return logoutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUseCase>(value),
    );
  }
}

String _$logoutUseCaseHash() => r'300e2217ae10e8725b3b361b444b01cecc3285d6';
