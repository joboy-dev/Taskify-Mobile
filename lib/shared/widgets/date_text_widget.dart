import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';


class DateTextWidget extends StatelessWidget {
  const DateTextWidget({
    super.key, required this.iconBackgroundColor, required this.dateText,
  });

  final Color iconBackgroundColor;
  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: iconBackgroundColor,
          radius: 20.r,
          child: Center(
            child: Icon(Icons.calendar_today_rounded, size: 20.w, color: kNeutralLight,),
          ),
        ),
        SizedBox(width: 10.w),
    
        Text(
          dateText,
          style: kNormalTextStyle(context).copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}