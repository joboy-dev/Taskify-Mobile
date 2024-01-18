import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/widgets/cards.dart';

class ActiveTasksScreen extends StatefulWidget {
  const ActiveTasksScreen({super.key});

  @override
  State<ActiveTasksScreen> createState() => _ActiveTasksScreenState();
}

class _ActiveTasksScreenState extends State<ActiveTasksScreen> {

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
              itemCount: 10,
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
