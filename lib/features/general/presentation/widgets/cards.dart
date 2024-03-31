import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({super.key, this.onTap, required this.child, this.color, this.borderColor, this.padding});

  final Function()? onTap;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(16.r),
      child: Card(
        color: color ?? kScaffoldBgColor(context),
        surfaceTintColor: Colors.transparent,
        elevation: kScaffoldBgColor(context) == kNeutralDark ? 0.0 : 2.r,
        shadowColor: kNeutralLightGrey,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? kNeutralLight,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.all(16.r),
          child: child,
        ),
      ),
    );
  }
}