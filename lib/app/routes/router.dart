import 'package:flutter_chat/app/routes/app_routes.dart';
import 'package:flutter_chat/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_chat/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter_chat/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter_chat/features/splash/presentation/pages/splah_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: '/${AppRoutes.splash}',
      name: AppRoutes.splash,
      builder: (_, _) => const SplahPage(),
    ),
    GoRoute(
      path: '/${AppRoutes.register}',
      name: AppRoutes.register,
      builder: (_, _) => const SignUpPage(),
    ),
    GoRoute(
      path: '/${AppRoutes.login}',
      name: AppRoutes.login,
      builder: (_, _) => const SignInPage(),
    ),
    GoRoute(
      path: '/${AppRoutes.chat}',
      name: AppRoutes.chat,
      builder: (_, _) => const ChatPage(),
    ),
  ],
);
