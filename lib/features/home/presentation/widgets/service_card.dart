import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soor_user_app/core/const/app_vectors.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/features/home/models/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback? onPressed;
  const ServiceCard({super.key, required this.service, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64.r,
            height: 64.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [service.startColor, service.endColor],
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                service.iconPath,
                width: 32.r,
                height: 32.r,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),

          SizedBox(height: 8.h),
          Text(
            service.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            'وصف الخدمة هنا',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.appTextSecoundryColor,
              fontSize: 14.sp,
            ),
          ),

          SizedBox(height: 8.h),

          BasicAppButton(
            onPressed: onPressed,
            title: 'ابدء الآن',
            vector: AppVectors.arrowLeft,
            height: 43.h,
          ),
        ],
      ),
    );
  }
}
