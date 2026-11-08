import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/const/app_vectors.dart';
import 'package:soor_user_app/core/helper/validators.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/core/widgets/basic_app_text_field.dart';
import 'package:soor_user_app/core/widgets/basic_password_field.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_footer.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              AppHeader(),
                              SizedBox(height: 24.h),
                              Text(
                                'مرحباً بك مرة أخرى!',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.sp,
                                    ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'مع سور ... انت فى السيلم ، قم بتسجيل الدخول الآن',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'رقم الجوال',
                          style: TextStyle(fontSize: 14.sp, ),
                        ),
                        SizedBox(height: 6.h),
                        BasicAppTextField(
                          controller: _phoneController,
                          hintText: 'ادخل رقمك',
                          validator: Validators.validatePhone,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'كلمة المرور',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 6.h),
                        BasicPasswordField(
                          hintText: 'ادخل كلمة السر',
                          controller: _passwordController,
                          validator: Validators.validateRequired,
                        ),
                        SizedBox(height: 24.h),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              context.push(AppRoutes.forgetPassword);
                            },
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        BasicAppButton(
                          onPressed: () {},
                          width: double.infinity,
                          fontSize: 14.sp,
                          title: 'تسجيل الدخول',
                          vector: AppVectors.arrowLeft,
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: AppFooter(
                              message: 'لا تمتلك حساب ؟',
                              action: 'حساب جديد',
                              onTap: () {
                                context.go(AppRoutes.signUp);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
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
