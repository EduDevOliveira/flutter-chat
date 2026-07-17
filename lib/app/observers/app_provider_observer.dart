import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppProviderObserver extends  ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    super.didUpdateProvider(context, previousValue, newValue);

    debugPrint(
      '[${context.provider.name ?? context.provider.runtimeType}] '
      '$previousValue -> $newValue',
    );
  }
}
