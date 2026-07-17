// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_users_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnlineUsersController)
final onlineUsersControllerProvider = OnlineUsersControllerProvider._();

final class OnlineUsersControllerProvider
    extends $NotifierProvider<OnlineUsersController, OnlineUsersState> {
  OnlineUsersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onlineUsersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onlineUsersControllerHash();

  @$internal
  @override
  OnlineUsersController create() => OnlineUsersController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnlineUsersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnlineUsersState>(value),
    );
  }
}

String _$onlineUsersControllerHash() =>
    r'd9df6f432124b7edf9414fa567907d3ba9233906';

abstract class _$OnlineUsersController extends $Notifier<OnlineUsersState> {
  OnlineUsersState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OnlineUsersState, OnlineUsersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnlineUsersState, OnlineUsersState>,
              OnlineUsersState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
