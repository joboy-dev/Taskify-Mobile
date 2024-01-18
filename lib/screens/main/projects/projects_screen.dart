import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/screens/main/projects/tabs/active_projects_screen.dart';
import 'package:taskify/screens/main/projects/tabs/completed_projects_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with TickerProviderStateMixin {
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    // TABBAR
    TabController tabController = TabController(length: 2, vsync: this);

    List<Widget> tabScreens = [
      const ActiveProjectsScreen(),
      const CompletedProjectsScreen()
,    ];

    List<Widget> tabs = [
      const Text('Active'),
      const Text('Completed'),
    ];

    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Projects',
      titleFontSize: 16.sp,
      trailing: const MenuButton(),
      screen: Column(
        children: [
          SearchField(
            hintText: 'Search', 
            onChanged: (value) {
              setState(() {
                searchTerm = value!;
              });
            },
          ),

          SizedBox(
            height: 500.h,
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
          ),
        ],
      ),
    );
  }
}