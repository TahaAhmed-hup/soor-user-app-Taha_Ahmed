import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/const/app_icons.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/features/home/models/offer_model.dart';

class CustomOfferBanner extends StatefulWidget {
  final List<OfferModel> offers;
  final VoidCallback? onBressed;
  const CustomOfferBanner({super.key, required this.offers, this.onBressed});

  @override
  State<CustomOfferBanner> createState() => _CustomOfferBannerState();
}

class _CustomOfferBannerState extends State<CustomOfferBanner> {
  int currrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.offers.isEmpty) {
      return SizedBox.shrink();
    }
    return SizedBox(
      width: 345.w,
      height: 156.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 7.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF000000)],
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: widget.offers.length,
                onPageChanged: (index) {
                  setState(() {
                    currrentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final offer = widget.offers[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                          height: 0.9
                        ),
                      ),
                      Spacer(),
                      BasicAppButton(
                        onPressed: widget.onBressed,
                        title: offer.buttonText,
                        width: 125.w,
                        height: 35.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        vector: AppIcons.arrowLeft,
                        backgroundColor: Color(0xFF007AA2),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 5.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.offers.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 7.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: currrentIndex == index
                        ? Color(0xFF007AA2)
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
