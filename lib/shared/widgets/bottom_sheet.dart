import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';

showSheet(BuildContext context, Widget screen, String screenTitle, {double height=650.0}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: kScaffoldBgColor(context),
    barrierColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLightGrey.withOpacity(0.5) : kNeutralDarkGrey.withOpacity(0.5),
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: BoxConstraints(minHeight: 500.h, maxHeight: height.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.r),
        topRight: Radius.circular(40.r),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: kAppPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                screenTitle,
                style: kNormalTextStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
                ),
              ),
            ),
            SizedBox(height: 20.h),
        
            SizedBox(
              height: (height - 120).h,
              child: SingleChildScrollView(
                child: screen
              ),
            ),
          ],
        ),
      );
    },
  );
}