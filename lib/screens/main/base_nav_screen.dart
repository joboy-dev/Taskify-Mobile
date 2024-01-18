import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/button.dart';

class BaseNavScreen extends StatefulWidget {
  const BaseNavScreen({
    super.key, 
    required this.title, 
    required this.icon, 
    required this.content,
    this.showAppbar=false,
    this.showBackButton=false,
    this.titleFontSize
  });

  final String title;
  final IconData icon;
  final Widget content;
  final bool? showAppbar;
  final bool? showBackButton;
  final double? titleFontSize;

  @override
  State<BaseNavScreen> createState() => _BaseNavScreenState();
}

class _BaseNavScreenState extends State<BaseNavScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: widget.showAppbar!,
      showBackButton: widget.showBackButton,
      title: widget.title,
      titleFontSize: widget.titleFontSize ?? 22.sp,
      trailing: const MenuButton(),
      screen: Column(
        children: [
          widget.showAppbar! ? const SizedBox() : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: kAppbarTextStyle(context),
                  ),
                  SizedBox(width: 10.w),
                  Icon(widget.icon, color: kMainColor(context), size: 24.sp,)
                ],
              ),
              const MenuButton(),
            ],
          ),
          widget.showAppbar! ? const SizedBox() : SizedBox(height: 20.h),

          widget.content,
        ],
      ),
    );
  }
}