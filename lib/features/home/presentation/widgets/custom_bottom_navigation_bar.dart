import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/const/app_icons.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        backgroundColor: AppColors.navBarBackground,

        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.appTextColor,

        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,

        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                navigationShell.currentIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.appTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.services,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                navigationShell.currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.appTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'الخدمات',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.booking,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                navigationShell.currentIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.appTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'الحجوزات',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.more,
              // width: 10.w,
              height: 6.h,
              colorFilter: ColorFilter.mode(
                navigationShell.currentIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.appTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }
}
