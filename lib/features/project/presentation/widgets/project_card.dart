import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/navigator.dart';
import 'package:taskify/features/general/presentation/widgets/cards.dart';
import 'package:taskify/features/general/presentation/widgets/chart.dart';
import 'package:taskify/features/general/presentation/widgets/image_stack.dart';
import 'package:taskify/features/project/presentation/pages/project_detail.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectId,
    this.images, 
    required this.projectName, 
    required this.startDate, 
    required this.endDate, 
    required this.completedTasks, 
    required this.totalTasks,
  });

  final int projectId;
  final List<String>? images;
  final String projectName;
  final String startDate;
  final String endDate;
  final int completedTasks;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    int taskCompletePercent = ((completedTasks / totalTasks) * 100).round();

    return BaseCard(
      onTap: () {
        navigatorPush(context, const ProjectDetailScreen());
      },
      
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
                imagePaths: images ?? [],
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
      
    );
  }
}
