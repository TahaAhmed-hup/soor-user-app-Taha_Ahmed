import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/features/auth/login_screen.dart';
import 'package:soor_user_app/features/auth/signup_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (BuildContext context, GoRouterState state) {
          return const SignupScreen();
        },
      ),
    ],
  );
}
