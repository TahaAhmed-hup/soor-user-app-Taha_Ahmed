import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeemore;
  const SectionHeader({super.key, required this.title, this.onSeemore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (onSeemore != null)
          InkWell(
            onTap: onSeemore,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'المزيد',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
