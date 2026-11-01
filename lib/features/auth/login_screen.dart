import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BasicAppButton(onPressed: () => context.go(AppRoutes.signUp), title: 'go',)
      ),
    );
  }
}