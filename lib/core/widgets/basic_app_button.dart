import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  final String? vector;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double fontSize;
  final bool isLoading;
  final bool isEnabled;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.borderColor = AppColors.primaryColor,
    this.borderWidth = 1,
    this.borderRadius = 8,
    this.fontSize = 18,
    this.isLoading = false,
    this.vector,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Button vector: $vector');
    return SizedBox(
      height: height ?? 53.3,
      width: width,
      child: ElevatedButton(
        onPressed: (isLoading || !isEnabled) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor.withValues(alpha: 0.5),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: isLoading
                            ? textColor.withValues(alpha: 0.5)
                            : textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    if (vector != null) ...[
                      const SizedBox(width: 5),
                      SvgPicture.asset(vector!, width: 20, height: 20),
                    ],
                  ],
                ),
              ),
      ),
    );
  }
}
