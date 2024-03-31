import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key, 
    required this.icon, 
    required this.text, 
    required this.mainColor, 
    this.fontSize,
    this.iconSize,
    this.isBold = false,
  });

  final IconData icon;
  final String text;
  final Color mainColor;
  final double? fontSize;
  final double? iconSize;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize ?? 16.sp, color: kMainColor(context)),
        SizedBox(width: 5.w),
        Text(
          text,
          style: kNormalTextStyle(context).copyWith(
            fontSize: fontSize ?? 14.sp,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
          ),
        )
      ],
    );
  }
}