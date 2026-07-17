import 'package:flutter/material.dart';
import 'package:flutter_chat/app/routes/router.dart';
import 'package:flutter_chat/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      darkTheme: AppTheme.light,
    );
  }
}