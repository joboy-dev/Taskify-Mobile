import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/navigator.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key, 
    required this.title,
    // required this.icon,
    this.backgroundColor,
    this.titleColor,
    this.elevation,
    this.trailing,
    required this.showBackButton,
    this.bottom,
    this.height,
    this.fontSize,
  });

  final String title;
  // final IconData icon;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? elevation;
  final double? height;
  final Widget? trailing;
  final bool showBackButton;
  final PreferredSizeWidget? bottom;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: AppBar(
        title: Text(title, style: kAppbarTextStyle(context).copyWith(color: titleColor ?? kMainColor(context), fontSize: fontSize ?? 22.sp)),
        leadingWidth: showBackButton ? 30.w : 0.0,
        leading: showBackButton ? IconButton(
          onPressed: () {
            navigatorPop(context);
          }, 
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            size: 24.sp,
            color: kMainColor(context)
          )
        ) : const SizedBox(),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor ?? kPrimaryColor,
        elevation: elevation ?? 0,
        shadowColor: kMainColor(context), // match with dark mode
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r)
        ),
        actions: [
          trailing ?? const SizedBox(),
        ],
        bottom: bottom,
      ),
    );
  }

  // important when implementing  PreferredSizeWidget class for custom appbars
  @override
  Size get preferredSize => Size.fromHeight(height ?? 40.h);
}
