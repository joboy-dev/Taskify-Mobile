import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/models/menu_item.dart';
import 'package:taskify/screens/main/base_nav_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/bottom_sheet.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/cards.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> with TickerProviderStateMixin {

  List<String> images = [
    'assets/images/feature1.png',
    'assets/images/feature2.png',
    'assets/images/feature3.png',
    'assets/images/feature1.png',
    'assets/images/feature2.png',
    'assets/images/feature3.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = [
      MenuItem(
        text: 'Check done', 
        textColor: kMainColor(context),
        icon: Icons.task_alt_rounded, 
        onTap: () {

        },
      ),

      MenuItem(
        text: 'Delete project',
        textColor: kRedColor, 
        icon: Icons.delete_outline_rounded, 
        onTap: () {
          
        },
      ),
    ];
    
    return BaseNavScreen(
      showAppbar: true,
      showBackButton: true,
      title: 'Project Detail',
      titleFontSize: 16.sp,
      icon: Icons.note,
      content: Column(
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

              MenuButton(
                items: items, 
                icon: Icons.menu,
                containerColor: Colors.transparent,
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
                        return TaskCard(
                          taskId: 1,
                          images: images,
                          taskName: 'Task Name', 
                          startDate: '01/01/2024',
                          endDate: '02/02/2024',
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

