import 'package:flutter/material.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class AppFooter extends StatelessWidget {
  final String message;
  final String action;
  final VoidCallback? onTap;
  const AppFooter({
    super.key,
    required this.message,
    required this.action,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, style: TextStyle(color: Colors.grey[600])),
        SizedBox(width: 5,),
        InkWell(
          onTap: onTap,
          child: Text(
            action,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
