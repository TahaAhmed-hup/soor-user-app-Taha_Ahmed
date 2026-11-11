import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soor_user_app/core/const/app_icons.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_header.dart';
import 'package:soor_user_app/features/home/data/mock_data.dart';
import 'package:soor_user_app/features/home/presentation/widgets/custom_offer_banner.dart';
import 'package:soor_user_app/features/home/presentation/widgets/section_header.dart';
import 'package:soor_user_app/features/home/presentation/widgets/service_circle.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.12),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.12)),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppIcons.notification, width: 20.w),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomOfferBanner(offers: MockData.offers),
                SizedBox(height: 16.h,),
                Column(
                  children: [
                    SectionHeader(title: 'الخدمات',onSeemore: (){},),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ServiceCircle(
                        service: MockData.services[0],
                        onTap: () {
                          
                        },
                      ),
                      SizedBox(width: 16.w,),
                      ServiceCircle(
                        service: MockData.services[1],
                        onTap: () {
                          
                        },
                      )
                    ],  
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
