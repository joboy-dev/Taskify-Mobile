import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/general/presentation/pages/base_nav_screen.dart';
import 'package:taskify/features/general/presentation/pages/base_screen.dart';
import 'package:taskify/features/general/presentation/widgets/textfield.dart';
import 'package:taskify/core/constants/constants.dart';

import 'tabs/analytics_screen.dart';
import 'tabs/overview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    // TABBAR
    TabController tabController = TabController(length: 2, vsync: this);

    List<Widget> tabScreens = [
      const OverviewScreen(),
      const AnalyticsScreen()
,    ];

    List<Widget> tabs = [
      const Text('Overview'),
      const Text('Analytics'),
    ];

    return BaseNavScreen(
      title: 'Dashboard',
      icon: Icons.dashboard_customize_outlined,
      content: Column(
        children: [
          SearchField(
            hintText: 'Search', 
            onChanged: (value) {
              setState(() {
                searchTerm = value!;
              });
            },
          ),

          searchTerm.isEmpty ? SizedBox(
            height: 430.h,
            width: double.infinity,
            child: DefaultTabController(
              length: 2, 
              child: BaseScreenUnscrollable(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.r),
                screen: TabBarView(
                  controller: tabController,
                  children: tabScreens,
                ), 
                showAppBar: true,
                title: '',
                tabBar: TabBar(
                  tabs: tabs,
                  controller: tabController,
                  dividerColor: kScaffoldBgColor(context),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  overlayColor: MaterialStatePropertyAll(kScaffoldBgColor(context)),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    color: kPrimaryColor,
                  ),
                  indicatorColor: kPrimaryColor,
                  labelPadding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 16.r),
                  labelColor: kNeutralLight,
                  labelStyle: kNormalTextStyle(context).copyWith(
                    fontSize: 16.sp, 
                    fontWeight: FontWeight.bold,
                    color: kNeutralLightGrey
                  ),
                  unselectedLabelColor: kNeutralDarkGrey,
                  unselectedLabelStyle: kNormalTextStyle(context).copyWith(
                    fontSize: 16.sp, 
                    fontWeight: FontWeight.bold,
                    color: kNeutralLightGrey
                  ),
                ),
              )
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}