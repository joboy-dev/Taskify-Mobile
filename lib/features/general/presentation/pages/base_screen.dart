import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/features/general/presentation/widgets/custom_appbar.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    super.key, 
    required this.screen, 
    this.padding, 
    required this.showAppBar,
    this.title,
    this.showBackButton,
    this.trailing,
    this.tabBar,
    this.appbarHeight,
    this.titleFontSize,
  });

  final Widget screen;
  final EdgeInsets? padding;
  final bool showAppBar;
  final String? title;
  final bool? showBackButton;
  final Widget? trailing;
  final PreferredSizeWidget? tabBar;
  final double? appbarHeight;
  final double? titleFontSize;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? CustomAppbar(
        title: widget.title ?? '',
        showBackButton: widget.showBackButton ?? false,
        titleColor: kMainColor(context),
        elevation: 0.0,
        backgroundColor: kScaffoldBgColor(context),
        trailing: widget.trailing,
        bottom: widget.tabBar,
        height: widget.appbarHeight,
        fontSize: widget.titleFontSize,
      ): null,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: widget.padding ?? kAppPadding(),
            child: widget.screen
          ),
        )
      ),
    );
  }
}


class BaseScreenUnscrollable extends StatefulWidget {
  const BaseScreenUnscrollable({
    super.key, 
    required this.screen, 
    this.padding, 
    required this.showAppBar,
    this.title,
    this.showBackButton,
    this.trailing,
    this.tabBar,
    this.appbarHeight,
    this.titleFontSize,
  });

  final Widget screen;
  final EdgeInsets? padding;
  final bool showAppBar;
  final String? title;
  final bool? showBackButton;
  final Widget? trailing;
  final PreferredSizeWidget? tabBar;
  final double? appbarHeight;
  final double? titleFontSize;

  @override
  State<BaseScreenUnscrollable> createState() => _BaseScreenUnscrollableState();
}

class _BaseScreenUnscrollableState extends State<BaseScreenUnscrollable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? CustomAppbar(
        title: widget.title ?? '',
        showBackButton: widget.showBackButton ?? false,
        titleColor: kMainColor(context),
        elevation: 0.0,
        backgroundColor: kScaffoldBgColor(context),
        trailing: widget.trailing,
        bottom: widget.tabBar,
        height: widget.appbarHeight ?? (kHeightWidth(context).height > 1000 ? 55.h : 40.h),
        fontSize: widget.titleFontSize,
      ): null,
      body: Padding(
        padding: widget.padding ?? kAppPadding(),
        child: widget.screen
      ),
    );
  }
}