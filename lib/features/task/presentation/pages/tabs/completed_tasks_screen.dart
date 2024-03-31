import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/task/presentation/widgets/task_card.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15.h),
          SizedBox(
            height: 440.h,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.h
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const MainTaskCard(
                  taskId: 1,
                  taskName: 'Task name', 
                  endDate: '19/01/2024',
                  priority: 'High',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

