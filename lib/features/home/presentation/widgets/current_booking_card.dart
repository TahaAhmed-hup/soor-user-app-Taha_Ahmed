import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/features/home/models/booking_model.dart';

class CurrentBookingCard extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback? onreview;

  const CurrentBookingCard({super.key, required this.booking, this.onreview});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h
      ),
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.bookingNumber,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xFF039855),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(booking.status, style: TextStyle(fontSize: 14.sp)),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${booking.price} ${booking.currency}',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                booking.time,
                style: TextStyle(color: AppColors.appTextSecoundryColor, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              onTap: onreview,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'اضافة تقييم',
                    style: TextStyle(color: Color(0XFF2D9EC4), fontSize: 14.sp),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.arrow_forward_ios, color: Color(0XFF2D9EC4), size: 14.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
