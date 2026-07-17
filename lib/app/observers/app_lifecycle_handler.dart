import 'package:flutter/material.dart';
import 'package:flutter_chat/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLifecycleHandler extends ConsumerStatefulWidget {
  const AppLifecycleHandler({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  ConsumerState<AppLifecycleHandler> createState() =>
      _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends ConsumerState<AppLifecycleHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(setAbsentUseCaseProvider).call(status: false);

      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        ref.read(setAbsentUseCaseProvider).call(status: true);
      case AppLifecycleState.inactive:
        ref.read(setAbsentUseCaseProvider).call(status: true);
        break;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
