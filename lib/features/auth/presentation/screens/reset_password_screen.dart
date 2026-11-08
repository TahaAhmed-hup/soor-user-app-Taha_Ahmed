import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:soor_user_app/core/helper/validators.dart';
import 'package:soor_user_app/core/routes/app_routes.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/core/widgets/basic_app_button.dart';
import 'package:soor_user_app/core/widgets/basic_password_field.dart';
import 'package:soor_user_app/features/auth/presentation/widgets/app_header.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String get password => _passwordController.text;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        AppHeader(),
                        SizedBox(height: 24.h),
                        Text(
                          'إعادة ضبط كلمة المرور',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Text('كلمة المرور', style: TextStyle(fontSize: 14.sp)),
                  SizedBox(height: 6.h),
                  BasicPasswordField(
                    controller: _passwordController,
                    hintText: '*********',
                    validator: Validators.validateStrongPassword,
                  ),
                  SizedBox(height: 14.h),

                  Text('تأكيد  كلمة المرور', style: TextStyle(fontSize: 14.sp)),
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
                  SizedBox(height: 32.h),
                  BasicAppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.go(AppRoutes.passwordChanged);
                      }
                    },
                    width: double.infinity,
                    fontSize: 14.sp,
                    title: 'حفظ',
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
