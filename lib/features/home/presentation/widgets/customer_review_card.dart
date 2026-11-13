import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/features/home/models/review_model.dart';

class CustomerReviewCard extends StatelessWidget {
  final ReviewModel review;

  const CustomerReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.customerName,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  final starValue = index + 1;

                  IconData icon;

                  if (review.rating >= starValue) {
                    icon = Icons.star;
                  } else if (review.rating >= starValue - 0.5) {
                    icon = Icons.star_half;
                  } else {
                    icon = Icons.star_border;
                  }

                  return Icon(
                    icon,
                    size: 20.w,
                    color: review.rating >= starValue - 0.5
                        ? AppColors.primaryColor
                        : Colors.white,
                  );
                }),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              review.comment,
              style: TextStyle(
                color: AppColors.appTextSecoundryColor,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
