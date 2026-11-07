import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class OtpBox extends StatelessWidget {
  final String number;
  final bool isActive;

  const OtpBox({super.key, required this.number, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.otpBoxColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: isActive ? AppColors.otpActiveBorderColor : Colors.transparent,

        ),
      ),
      child: Text(
        number,
        style: TextStyle(
          fontSize: 22.sp,
          color: AppColors.appTextColor,
        ),
      ),
    );
  }
}