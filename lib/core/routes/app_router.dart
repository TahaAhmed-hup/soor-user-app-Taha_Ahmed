import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/features/auth/data/models/otp_arguments.dart';
import 'package:soor_user_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/login_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/password_changed_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:soor_user_app/features/auth/presentation/screens/success_screen.dart';
import 'package:soor_user_app/features/home/presentation/screens/home_screen.dart';
import 'package:soor_user_app/features/home/presentation/screens/main_screen.dart';
import 'package:soor_user_app/features/home/presentation/screens/services_screen.dart';
import 'package:soor_user_app/features/orders/presentation/screens/bookings_screen.dart';
import 'package:soor_user_app/features/settings/presentation/screens/more_screen.dart';

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
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (BuildContext context, GoRouterState state) {
          return ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.passwordChanged,
        builder: (BuildContext context, GoRouterState state) {
          return PasswordChangedScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return MainScreen(navigationShell: navigationShell);
            },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.service,
                builder: (context, state) => ServicesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.booking,
                builder: (context, state) => BookingsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.more,
                builder: (context, state) => MoreScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
