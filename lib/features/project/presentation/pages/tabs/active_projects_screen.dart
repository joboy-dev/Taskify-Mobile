import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/project/presentation/widgets/project_card.dart';

class ActiveProjectsScreen extends StatefulWidget {
  const ActiveProjectsScreen({super.key});

  @override
  State<ActiveProjectsScreen> createState() => _ActiveProjectsScreenState();
}

class _ActiveProjectsScreenState extends State<ActiveProjectsScreen> {

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
        children: [
          SizedBox(height: 15.h),
          SizedBox(
            height: 440.h,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProjectCard(
                  projectId: 1,
                  images: images,
                  projectName: 'Project name',
                  startDate: '01/01/2024',
                  endDate: '20/01/2024',
                  completedTasks: 10,
                  totalTasks: 48,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

