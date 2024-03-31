import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/features/general/presentation/widgets/icon_with_text.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key, required this.sectionTitle, required this.icon, required this.child,
  });

  final String sectionTitle;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconWithText(
          icon: icon,
          text: sectionTitle,
          mainColor: kMainColor(context),
          isBold: true,
          fontSize: 16.sp,
          iconSize: 24.w,
        ),
        SizedBox(height: 15.h),

        child,
        SizedBox(height: 20.h),
    
      ],
    );
  }
}