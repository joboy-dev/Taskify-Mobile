import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/main/home/home_screen.dart';
import 'package:taskify/screens/main/projects/projects_screen.dart';
import 'package:taskify/screens/main/settings/settings_screen.dart';
import 'package:taskify/screens/main/tasks/tasks_screen.dart';
import 'package:taskify/shared/constants.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _index = 0;

  List<CustomNavigationBarItem> _navItems() => [
    CustomNavigationBarItem(
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home),
      selectedTitle: Text(
        '•',
        style: kNormalTextStyle(context).copyWith(
          color: kSecondaryColor,
          fontSize: 4.sp
        ),
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.work_outline),
      selectedIcon: const Icon(Icons.work),
      selectedTitle: Text(
        '•',
        style: kNormalTextStyle(context).copyWith(
          color: kSecondaryColor,
          fontSize: 4.sp
        ),
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.notifications_outlined),
      selectedIcon: const Icon(Icons.notifications),
      selectedTitle: Text(
        '•',
        style: kNormalTextStyle(context).copyWith(
          color: kSecondaryColor,
          fontSize: 4.sp
        ),
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.settings_outlined),
      selectedIcon: const Icon(Icons.settings),
      selectedTitle: Text(
        '•',
        style: kNormalTextStyle(context).copyWith(
          color: kSecondaryColor,
          fontSize: 4.sp
        ),
      ),
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const ProjectsScreen(),
    const TasksScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_index],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.r, left: 16.r, right: 16.r),
        child: CustomNavigationBar(
          items: _navItems(), 
          currentIndex: _index, 
          onTap: (val) {
            setState(() {
              _index = val;
            });
          },
          backgroundColor:  kScaffoldBgColor(context) == kNeutralDark ? kPrimaryColor : kNeutralLight,
          isFloating: true,
          borderRadius: Radius.circular(16.r),
          scaleCurve: Curves.ease,
          bubbleCurve: Curves.ease,
          strokeColor: Colors.transparent,
          selectedColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : kPrimaryColor,
          unSelectedColor: kNeutralDarkGrey,
          iconSize: 24.sp,
          elevation: 10.r,
        ),
      ),
    );
  }
}