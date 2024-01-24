import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/models/menu_item.dart';
import 'package:taskify/screens/main/base_nav_screen.dart';
import 'package:taskify/screens/main/tasks/task_detail.dart';
import 'package:taskify/shared/constants.dart';
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
        text: 'Add team', 
        textColor: kMainColor(context),
        icon: Icons.people_alt_outlined, 
        onTap: () {

        },
      ),

      MenuItem(
        text: 'Delete project',
        textColor: kSemanticRed, 
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
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () {
                      
                    }, 
                    icon: Icon(Icons.edit, size: 24.w, color: kMainColor(context),),
                  )
                ],
              ),

              MenuButton(
                items: items, 
                icon: Icons.menu,
                containerColor: Colors.transparent,
                iconColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : kNeutralDark,
              ),

            ],
          ),
          SizedBox(height: 20.h),

          SectionWidget(
            sectionTitle: 'Members', 
            icon: Icons.people_alt_outlined, 
            child: SizedBox(
              height: 380.h,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kScaffoldBgColor(context),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 1.w
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 24.w, color: kSecondaryColor,),
                        SizedBox(width: 10.w),
                        Text(
                          'Add member',
                          style: kNormalTextStyle(context).copyWith(
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  
                  SizedBox(
                    height: 300.h,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return BaseCard(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  backgroundColor: kNeutralLightGrey,
                                  radius: 24.r,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name Name',
                                      style: kNormalTextStyle(context).copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(
                                    children: [
                                      Text(
                                        'Role: ',
                                        style: kSecondaryNormalTextStyle(context),
                                      ),
                                      Text(
                                        'Viewer',
                                        style: kSecondaryNormalTextStyle(context).copyWith(
                                          color: kSecondaryColor
                                        ),
                                      ),
                                    ],
                                  ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ),

          SectionWidget(
            sectionTitle: 'Standalone tasks',
            icon: Icons.task_alt,
            child: SizedBox(
              width: double.infinity,
              height: 300.h,
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
          ),

          SectionWidget(
            sectionTitle: 'Teams',
            icon: Icons.people_outlined,
            child: SizedBox(
              width: double.infinity,
              height: 450.h,
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
                      height: 300.h,
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
          ),
        ],
      ),
    );
  }
}

