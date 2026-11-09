import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
