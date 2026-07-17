import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat/app/app.dart';
import 'package:flutter_chat/app/observers/app_provider_observer.dart';
import 'package:flutter_chat/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  runApp(
    ProviderScope(
      observers: [
        AppProviderObserver(),
      ],
      child: const App(),
    ),
  );
}
