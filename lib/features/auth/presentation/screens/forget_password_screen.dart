import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/helper/validators.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/core/widgets/basic_app_text_field.dart';
import 'package:soor_user_app/features/auth/data/models/otp_arguments.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_header.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        AppHeader(),
                        SizedBox(height: 24.h),
                        Text(
                          'هل نسيت كلمة المرور؟',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Text('رقم الجوال', style: TextStyle(fontSize: 14.sp)),
                  SizedBox(height: 6.h),
                  BasicAppTextField(
                    controller: _phoneController,
                    hintText: 'ادخل رقمك',
                    validator: Validators.validatePhone,
                  ),
                  SizedBox(height: 32.h),
                  BasicAppButton(
                    onPressed: () {
                       if (_formKey.currentState!.validate()) {
                                      context.push(
                                        AppRoutes.otp,
                                        extra: OtpArguments(
                                          phone: _phoneController.text.trim(),
                                          flow: OtpFlow.forgetPassword,
                                        ),
                                      );
                                    }
                    },
                    width: double.infinity,
                    fontSize: 14.sp,
                    title: 'إرسال',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
