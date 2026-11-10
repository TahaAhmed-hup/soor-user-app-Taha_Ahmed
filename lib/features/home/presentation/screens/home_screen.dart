import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soor_user_app/core/const/app_icons.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: AppHeader(),
        ),
        hideBack: true,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 2.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.12),
                border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.12),
                ),
                borderRadius: BorderRadius.circular(30.r)
              ),
              child: IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.notification,width: 20.w,))),
          )
        ],
      ),
    );
  }
}