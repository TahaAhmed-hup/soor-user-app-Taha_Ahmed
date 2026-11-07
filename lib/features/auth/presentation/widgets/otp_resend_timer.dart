import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';

class OtpResendTimer extends StatefulWidget {
  final VoidCallback onResend;
  final int duration;
  const OtpResendTimer({super.key, required this.onResend, this.duration = 60});

  @override
  State<OtpResendTimer> createState() => _OtpResendTimerState();
}

class _OtpResendTimerState extends State<OtpResendTimer> {
  Timer? _timer;
  late int remainingSeconds;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.duration;
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) return;

      if (remainingSeconds <= 1) {
        timer.cancel();
        setState(() {
          remainingSeconds = 0;
        });
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  String get formattedTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');

    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  void resendCode(){
    widget.onResend();

    setState(() {
      remainingSeconds = widget.duration;
    });

    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(formattedTime,style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),),

          SizedBox(height: 22.h,),
          
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'لم تتلق الرمز؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey
                ),
              ),
              TextButton(onPressed: resendCode,
              child: Text(
                'إعادة إرسال',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor
                ),
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}
