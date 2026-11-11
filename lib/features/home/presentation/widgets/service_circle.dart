import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soor_user_app/features/home/models/service_model.dart';

class ServiceCircle extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback? onTap;
  const ServiceCircle({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [service.startColor, service.endColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              service.iconPath,
              width: 22.w,
              height: 22.h,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(height: 8.h,),
            Text(
              service.name,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
