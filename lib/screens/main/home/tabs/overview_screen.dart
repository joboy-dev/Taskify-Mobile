import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/main/projects/projects_screen.dart';
import 'package:taskify/screens/main/tasks/tasks_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/cards.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          IconTextButton(
            text: 'Your recent projects', 
            iconWidget:  Icon(Icons.dashboard_outlined, color: kSecondaryColor, size: 24.sp,),
            onPressed: () {
              navigatorPush(context, const ProjectsScreen());
            },
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            trailing: Icon(Icons.arrow_forward_ios, color: kMainColor(context).withOpacity(0.5), size: 16.sp,),
          ),
          SizedBox(height: 5.h),

          SizedBox(
            height: 145.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProjectCard(
                  projectId: 1,
                  images: images,
                  projectName: 'Project name',
                  startDate: '01/01/2024',
                  endDate: '20/01/2024',
                  completedTasks: 10,
                  totalTasks: 50,
                );
              },
            ),
          ),

          SizedBox(height: 20.h),
          IconTextButton(
            text: 'Your recent tasks', 
            iconWidget:  Icon(Icons.checklist_outlined, color: kSecondaryColor, size: 24.sp,),
            onPressed: () {
              navigatorPush(context, const TasksScreen());
            },
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            trailing: Icon(Icons.arrow_forward_ios, color: kMainColor(context).withOpacity(0.5), size: 16.sp,),
          ),
          SizedBox(height: 5.h),

          SizedBox(
            height: 145.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const MiniTaskCard(
                  taskId: 1,
                  taskName: 'Task name', 
                  endDate: '19/01/2024',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

