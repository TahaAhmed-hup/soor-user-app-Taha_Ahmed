import 'package:flutter/material.dart';
import 'package:soor_user_app/core/routes/app_router.dart';
import 'package:soor_user_app/core/themes/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
