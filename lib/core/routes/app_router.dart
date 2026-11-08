import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/features/auth/data/models/otp_arguments.dart';
import 'package:soor_user_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/login_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/success_screen.dart';

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
      GoRoute(
        path: AppRoutes.otp,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra;
          if (extra is! OtpArguments) {
            return SignupScreen();
          }
          return OtpScreen(phone: extra.phone, flow: extra.flow);
        },
      ),
      GoRoute(
        path: AppRoutes.success,
        builder: (BuildContext context, GoRouterState state) {
          return const SuccessScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (BuildContext context, GoRouterState state) {
          return ForgetPasswordScreen();
        },
      ),
    ],
  );
}
