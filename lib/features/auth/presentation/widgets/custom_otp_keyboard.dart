import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class CustomOtpKeyboard extends StatelessWidget {
  final ValueChanged<String> onNumberPressed;
  final VoidCallback onDeletePressed;

  const CustomOtpKeyboard({
    super.key,
    required this.onNumberPressed,
    required this.onDeletePressed,
  });

  Widget _buildKey(String number) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: SizedBox(
          height: 45.h,
          child: ElevatedButton(
            onPressed: () => onNumberPressed(number),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.otpKeyColor,
              foregroundColor: AppColors.appTextColor,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            child: Text(number, style: TextStyle(fontSize: 20.sp)),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteKey() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: SizedBox(
          height: 45.h,
          child: IconButton(
            onPressed: onDeletePressed,
            icon: Icon(Icons.backspace_outlined, color: AppColors.appTextColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final numbers = [
      ['1','2','3'],
      ['4','5','6'],
      ['7','8','9'],
    ];
    return Directionality(textDirection: TextDirection.ltr, 
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 10.h
      ),
      decoration: BoxDecoration(
        color: Color(0xFF303030),
        
        // borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(mainAxisSize: MainAxisSize.min,
      children: [
        ... numbers.map(
          (row) => Row(
            children: row.map((number) => _buildKey(number)).toList(),
          ),
        ),
        Row(
          children: [
            Spacer(),
            _buildKey('0'),
            _buildDeleteKey(),
          ],
        )
      ],
      ),
    ),
    );
  }
}
