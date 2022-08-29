import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_arch/features/auth/pages/login.page.dart';
import 'package:starter_arch/features/auth/pages/splash.page.dart';
import 'package:starter_arch/features/home/pages/home.page.dart';

class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String login = "/login";

  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: splash,
        name: splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: home,
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: login,
        name: login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
    ],
  );
}
