import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soor_user_app/core/widgets/basic_app_bar.dart';
import 'package:soor_user_app/features/home/data/mock_data.dart';
import 'package:soor_user_app/features/home/presentation/widgets/service_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titleText:'الخدمات',
        hideBack: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          itemCount: MockData.services.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemBuilder: (context, index) {
            final service = MockData.services[index];

            return ServiceCard(service: service, onPressed: () {});
          },
        ),
      ),
    );
  }
}
