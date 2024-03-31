import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';

showSheet(BuildContext context, Widget screen, String screenTitle, {double height=650.0}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: kScaffoldBgColor(context),
    barrierColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLightGrey.withOpacity(0.5) : kNeutralDarkGrey.withOpacity(0.5),
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.r),
        topRight: Radius.circular(40.r),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        expand: false,
        snap: true,
        snapAnimationDuration: kDurationMs(200),
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
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
              
                  screen,
                ],
              ),
            ),
          );
        },
      );
    },
  );
}