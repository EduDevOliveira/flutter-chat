// import 'package:flutter/material.dart';

// class AppLifecycleHandler extends WidgetsBindingObserver {
//   AppLifecycleHandler(this.ref);

//   final Ref ref;

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.resumed:
//         ref.read(sessionControllerProvider.notifier).setOnline();
//         break;

//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         ref.read(sessionControllerProvider.notifier).setOffline();
//         break;

//       default:
//         break;
//     }
//   }
// }