import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/main/projects/project_detail.dart';
import 'package:taskify/screens/main/tasks/task_detail.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/chart.dart';
import 'package:taskify/shared/widgets/image_stack.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectId,
    required this.images, 
    required this.projectName, 
    required this.startDate, 
    required this.endDate, 
    required this.completedTasks, 
    required this.totalTasks,
  });

  final int projectId;
  final List<String> images;
  final String projectName;
  final String startDate;
  final String endDate;
  final int completedTasks;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    int taskCompletePercent = ((completedTasks / totalTasks) * 100).round();

    return InkWell(
      onTap: () {
        navigatorPush(context, const ProjectDetailScreen());
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Card(
        color: kScaffoldBgColor(context),
        surfaceTintColor: Colors.transparent,
        elevation: kScaffoldBgColor(context) == kNeutralDark ? 0.0 : 2.r,
        shadowColor: kNeutralLightGrey,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kNeutralLight,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    projectName,
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
      
                  ImageStackHorizontal(
                    imagePaths: images,
                    imageRadius: 15.r,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16.w, color: kNeutralDarkGrey),
                      SizedBox(width: 5.w),
                      Text(
                        startDate,
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 11.sp
                        ),
                      )
                    ],
                  ),
      
                  Image(
                    image: const AssetImage('assets/vectors/arrow.png'),
                    fit: BoxFit.fill,
                    height: 14.h,
                    width: 50.w,
                  ),
      
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16.w, color: kPrimaryColor),
                      SizedBox(width: 5.w),
                      Text(
                        endDate,
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 11.sp,
                          color: kPrimaryColor
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 5.h),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskCompletePercent > 100 ? '100%' : '$taskCompletePercent%',
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
      
                  HorizontalBar(
                    height: 8.h,
                    innerWidth: 125.w,
                    outerWidth: (completedTasks / totalTasks) * 1,
                    innerColor: kNeutralLightGrey,
                    outerColor: kPrimaryColor,
                  ),
      
                  Row(
                    children: [
                      Text(
                        '$completedTasks',
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '/$totalTasks tasks',
                        style: kNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ],
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}


class MiniTaskCard extends StatelessWidget {
  const MiniTaskCard({
    super.key,
    required this.taskId,
    required this.taskName, 
    required this.endDate, 
    this.showAssigned=false,
  });

  final int taskId;
  final String taskName;
  final String endDate;
  final bool? showAssigned;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        navigatorPush(context, TaskDetail(taskId: taskId));
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Card(
        color: kScaffoldBgColor(context),
        surfaceTintColor: Colors.transparent,
        elevation: kScaffoldBgColor(context) == kNeutralDark ? 0.0 : 2.r,
        shadowColor: kNeutralLightGrey,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kNeutralLight,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: kNeutralLightGrey,
                radius: 25.r,
                child: Center(
                  child: Icon(Icons.task_alt, color: kNeutralDark, size: 30.w,),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
      
                  showAssigned! ? Row(
                    children: [
                      Text(
                        'Assigned to: ',
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 14.sp
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Member name',
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 14.sp,
                          color: kSecondaryColor
                        ),
                      )
                    ],
                  ) : const SizedBox(),
                  SizedBox(height: 5.h),
      
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16.w, color: kNeutralDarkGrey),
                      SizedBox(width: 5.w),
                      Text(
                        'Deadline: $endDate',
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 14.sp
                        ),
                      )
                    ],
                  ),
                  
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}


class MainTaskCard extends StatelessWidget {
  const MainTaskCard({
    super.key,
    required this.taskId,
    required this.taskName, 
    required this.endDate, 
    required this.priority
  });

  final int taskId;
  final String taskName;
  final String endDate;
  final String priority;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        navigatorPush(context, TaskDetail(taskId: taskId));
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Card(
        color: kScaffoldBgColor(context),
        surfaceTintColor: Colors.transparent,
        elevation: kScaffoldBgColor(context) == kNeutralDark ? 0.0 : 2.r,
        shadowColor: kNeutralLightGrey,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kNeutralLight,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 12.r),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kNeutralLightGrey,
                    radius: 12.r,
                    child: Center(
                      child: Icon(Icons.task_alt, color: kNeutralDark, size: 15.w,),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    taskName,
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_sharp, size: 14.w, color: kPrimaryColor),
                      SizedBox(width: 5.w),
                      Text(
                        'Deadline:',
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          color: kPrimaryColor
                        ),
                      )
                    ],
                  ),
      
                  Padding(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Text(
                      endDate,
                      style: kSecondaryNormalTextStyle(context).copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
      
                  Row(
                    children: [
                      Icon(Icons.priority_high_rounded, size: 14.w, color: kSecondaryColor),
                      SizedBox(width: 5.w),
                      Text(
                        'Priority:',
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          color: kSecondaryColor
                        ),
                      )
                    ],
                  ),
      
                  Padding(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Text(
                      priority,
                      style: kSecondaryNormalTextStyle(context).copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}


class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskId,
    required this.images, 
    required this.taskName, 
    required this.startDate, 
    required this.endDate,
  });

  final int taskId;
  final List<String> images;
  final String taskName;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        navigatorPush(context, TaskDetail(taskId: taskId));
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Card(
        color: kScaffoldBgColor(context),
        surfaceTintColor: Colors.transparent,
        elevation: kScaffoldBgColor(context) == kNeutralDark ? 0.0 : 2.r,
        shadowColor: kNeutralLightGrey,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kNeutralLight,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: kNeutralLightGrey,
                        radius: 12.r,
                        child: Center(
                          child: Icon(Icons.task_alt, color: kNeutralDark, size: 20.w,),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        taskName,
                        style: kNormalTextStyle(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
      
                  ImageStackHorizontal(
                    imagePaths: images,
                    imageRadius: 15.r,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16.w, color: kNeutralDarkGrey),
                      SizedBox(width: 5.w),
                      Text(
                        startDate,
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 11.sp
                        ),
                      )
                    ],
                  ),
      
                  Image(
                    image: const AssetImage('assets/vectors/arrow.png'),
                    fit: BoxFit.fill,
                    height: 14.h,
                    width: 50.w,
                  ),
      
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16.w, color: kPrimaryColor),
                      SizedBox(width: 5.w),
                      Text(
                        endDate,
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 11.sp,
                          color: kPrimaryColor
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
