import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/const/app_images.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 187.h,
                        width: double.infinity,
                        child: Image.asset(
                          AppImages.successedPage,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        'تم بنجاح!️',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'تم إنشاء حسابك بنجاح',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.appTextSecoundryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BasicAppButton(
                onPressed: () {},
                title: 'الى الرئيسية',
                width: double.infinity,
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
