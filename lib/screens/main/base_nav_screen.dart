import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/models/menu_item.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/screens/bottom_sheet/create_project_sheet.dart';
import 'package:taskify/screens/bottom_sheet/create_task_sheet.dart';
import 'package:taskify/screens/bottom_sheet/create_team_sheet.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/bottom_sheet.dart';
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
  bool showMenuItem = false;

  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = [
      MenuItem(
        text: 'Create task', 
        textColor: kMainColor(context),
        icon: Icons.task_alt_rounded, 
        onTap: () {
          showSheet(context, const CreateTaskSheet(), 'Create Task');
        },
      ),

      MenuItem(
        text: 'Create project', 
        textColor: kMainColor(context),
        icon: Icons.dashboard_customize_outlined, 
        onTap: () {
          showSheet(context, const CreateProjectSheet(), 'Create Project');
        },
      ),

      MenuItem(
        text: 'Create team', 
        textColor: kMainColor(context),
        icon: Icons.person_add_alt_outlined, 
        onTap: () {
          showSheet(context, const CreateTeamSheet(), 'Create Team');
        },
      ),
    ];

    return BaseScreen(
      showAppBar: widget.showAppbar!,
      showBackButton: widget.showBackButton,
      title: widget.title,
      titleFontSize: widget.titleFontSize ?? 22.sp,
      trailing: MenuButton(items: items, icon: Icons.add,),
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
              MenuButton(items: items, icon: Icons.add,),
            ],
          ),
          widget.showAppbar! ? const SizedBox() : SizedBox(height: 20.h),
          widget.content,
        ],
      ),
    );
  }
}

