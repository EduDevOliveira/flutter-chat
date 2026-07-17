import 'package:flutter/material.dart';
import 'package:flutter_chat/app/routes/app_routes.dart';
import 'package:flutter_chat/features/splash/presentation/controllers/session_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplahPage extends ConsumerStatefulWidget {
  const SplahPage({super.key});

  @override
  ConsumerState<SplahPage> createState() => _SplahPageState();
}

class _SplahPageState extends ConsumerState<SplahPage> {
  @override
  void initState() {
    ref.listenManual(
      sessionControllerProvider,
      (previous, next) {
        next.whenOrNull(
          data: (user) async {
            await Future.delayed(Duration(seconds: 3));
            if (!mounted) return;
            if (user != null) {
              return context.goNamed(AppRoutes.chat);
            }

            return context.goNamed(AppRoutes.login);
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
