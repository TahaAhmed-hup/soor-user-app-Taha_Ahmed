import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/features/auth/data/models/otp_arguments.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/custom_otp_keyboard.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/otp_box.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/otp_resend_timer.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final OtpFlow flow;
  const OtpScreen({super.key, required this.phone, required this.flow});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static const int otpLength = 5;

  final List<String> otp = List.filled(otpLength, '');

  bool get isOtpComplete => otp.every((digit) => digit.isNotEmpty);

  void addNumber(String number) {
    if (isOtpComplete) return;

    setState(() {
      final emptyIndex = otp.indexWhere((element) => element.isEmpty);

      if (emptyIndex != -1) {
        otp[emptyIndex] = number;
      }
    });
  }

  void removeNumber() {
    int lastIndex = otp.lastIndexWhere((element) => element.isNotEmpty);

    if (lastIndex == -1) return;

    setState(() {
      otp[lastIndex] = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    int activeIndex = otp.indexWhere((element) => element.isEmpty);

    return Scaffold(
      appBar: BasicAppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.h),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'التحقق',
                                      style: Theme.of(context).textTheme.bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.sp,
                                          ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'أدخل رمز التحقق الذي نرسله إليك: ',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        Text(
                                          widget.phone,
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    otpLength,
                                    (index) => OtpBox(
                                      number: otp[index],
                                      isActive: index == activeIndex,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 80.h),
                              Center(
                                child: OtpResendTimer(
                                  onResend: () {},
                                  duration: 60,
                                ),
                              ),
              
                              SizedBox(height: 25.h),
              
                              BasicAppButton(
                                onPressed: () {
                                  context.go(AppRoutes.success);
                                },
                                title: 'تأكيد',
                                width: double.infinity,
                                isEnabled: isOtpComplete,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      CustomOtpKeyboard(
                        onNumberPressed: addNumber,
                        onDeletePressed: removeNumber,
                      ),
              
                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
