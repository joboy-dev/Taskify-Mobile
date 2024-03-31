import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/general/presentation/pages/base_screen.dart';
import 'package:taskify/features/general/presentation/widgets/bottom_sheet.dart';
import 'package:taskify/features/general/presentation/widgets/button.dart';
import 'package:taskify/features/general/presentation/widgets/section_widget.dart';
import 'package:taskify/features/project/presentation/widgets/project_card.dart';
import 'package:taskify/features/task/presentation/widgets/task_card.dart';
import 'package:taskify/features/user/presentation/widgets/bottom_sheet/view_other_users_profile_sheet.dart';
import 'package:taskify/features/general/domain/entities/menu_item.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/features/general/presentation/widgets/cards.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({super.key, required this.teamId});

  final int teamId;

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
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
        text: 'Create task categpry',
        textColor: kMainColor(context), 
        icon: Icons.category_outlined, 
        onTap: () {
          
        },
      ),

      MenuItem(
        text: 'Create team task',
        textColor: kMainColor(context), 
        icon: Icons.add_task_outlined, 
        onTap: () {
          
        },
      ),

      MenuItem(
        text: 'Delete team',
        textColor: kSemanticRed, 
        icon: Icons.delete_outline_rounded, 
        onTap: () {
          
        },
      ),
    ];

    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Team detail',
      titleFontSize: 16.sp,
      trailing: Row(
        children: [
          MenuButton(
            items: items, 
            icon: Icons.menu,
            containerColor: Colors.transparent,
            iconColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : kNeutralDark,
          ),
        ],
      ),
      screen: SizedBox(
        height: 570.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kNeutralLightGrey,
                    radius: 24.r,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Team name',
                    style: kAppbarTextStyle(context),
                  ),
                  SizedBox(width: 5.w),
                  IconButton(
                    onPressed: () {
                      
                    }, 
                    icon: Icon(Icons.edit, size: 24.w, color: kMainColor(context),),
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
                            Icon(Icons.add, size: 24.w, color: kSecondaryColor),
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
                              onTap: () {
                                showSheet(
                                  context, 
                                  const ViewOtherUsersProfileSheet(), 
                                  'User Details'
                                );
                              },
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

              const SectionWidget(
                sectionTitle: 'Project', 
                icon: Icons.dashboard_outlined, 
                child: ProjectCard(
                  projectId: 1,
                  projectName: 'Project name',
                  startDate: '01/01/2024',
                  endDate: '20/01/2024',
                  completedTasks: 18,
                  totalTasks: 50,
                )
              ),

              SectionWidget(
                sectionTitle: 'Tasks', 
                icon: Icons.task_alt, 
                child: SizedBox(
                  height: 300.h,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}