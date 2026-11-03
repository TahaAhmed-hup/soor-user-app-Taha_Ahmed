import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/const/app_vectors.dart';
import 'package:soor_user_app/core/helper/validators.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/core/widgets/basic_app_text_field.dart';
import 'package:soor_user_app/core/widgets/basic_password_field.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_footer.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;
  bool _isChecked = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
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
                              SizedBox(height: 8.h),
                              AppHeader(),
                              SizedBox(height: 22.h),
                              Text(
                                'إنشاء حساب!',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 22.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'رقم الجوال',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(height: 6.h),
                            BasicAppTextField(
                              controller: _phoneController,
                              hintText: 'ادخل رقمك',
                              validator: Validators.validatePhone,
                            ),
                            SizedBox(height: 14.h),
                            Text(
                              'البريد الإلكترونى',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(height: 6.h),
                            BasicAppTextField(
                              controller: _emailController,
                              hintText: 'ادخل البريد الإلكترونى',
                              validator: Validators.validateEmail,
                            ),
                            SizedBox(height: 14.h),

                            Text('الاسم كامل', style: TextStyle(fontSize: 14)),
                            SizedBox(height: 6.h),
                            BasicAppTextField(
                              controller: _nameController,
                              hintText: 'ادخل الاسم كامل',
                              validator: Validators.validateName,
                            ),
                            SizedBox(height: 14.h),

                            Text(
                              'كلمة المرور',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(height: 6.h),
                            BasicPasswordField(
                              controller: _passwordController,
                              hintText: '*********',
                              validator: Validators.validateStrongPassword,
                            ),
                            SizedBox(height: 14.h),

                            Text(
                              'تأكيد  كلمة المرور',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(height: 6.h),
                            BasicPasswordField(
                              controller: _confirmPasswordController,
                              hintText: '*********',
                              validator: (confirmPassword) =>
                                  Validators.validateConfirmPassword(
                                    confirmPassword,
                                    password,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 22.h),
                        Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'أوافق على شروط الخدمة و ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'سياسة الخصوصية',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: AppColors.primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 4,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              BasicAppButton(
                                onPressed: () {},
                                width: double.infinity,
                                fontSize: 14.sp,
                                title: 'تسجيل الدخول',
                                vector: AppVectors.arrowLeft,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: AppFooter(
                            message: 'هل تمتلك حساب بالفعل ؟',
                            action: 'تسجيل دخول',
                            onTap: () {
                                  context.go(AppRoutes.login);
                                },
                          ),
                        ),
                        SizedBox(height: 8.h,)
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
