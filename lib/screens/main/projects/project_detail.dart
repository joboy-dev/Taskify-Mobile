import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/cards.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> with TickerProviderStateMixin {
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Project Detail',
      titleFontSize: 16.sp,
      trailing: const MenuButton(),
      screen: Column(
        children: [
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.dashboard_outlined, size: 36.w, color: kNeutralDarkGrey),
                  SizedBox(width: 15.w),
                  Text(
                    'Project Name',
                    style: kAppbarTextStyle(context),
                  )
                ],
              ),

              IconButton(
                onPressed: () {
                  
                }, 
                icon: Icon(Icons.menu_outlined, size: 24.sp, color: kMainColor(context),)
              ),
            ],
          ),
          SizedBox(height: 20.h),

          SizedBox(
            width: double.infinity,
            height: 500.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ExpandablePanel(
                  controller: ExpandableController(),
                  header: Text(
                    'Team Name',
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  collapsed: const SizedBox(),
                  expanded: SizedBox(
                    height: 400.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const MiniTaskCard(
                          taskId: 1,
                          taskName: 'Task Name', 
                          endDate: '02/02/2024',
                          showAssigned: true,
                        );
                      },
                    ),
                  ),
                  theme: ExpandableThemeData(
                    iconColor: kMainColor(context),
                    useInkWell: false
                  ),
                );
              },
            
            ),
          ),
        ],
      ),
    );
  }
}

