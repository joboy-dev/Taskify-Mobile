import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';

showSnackbar(BuildContext context, String text, {SnackBarAction? action}) {
  ScaffoldMessenger.of(context).clearSnackBars();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:Text(
        text, 
        textAlign: TextAlign.center,
        style: kNormalTextStyle(context).copyWith(color: kNeutralLight, fontWeight: FontWeight.bold)
      ),
      backgroundColor: kSecondaryColor,
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      // margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      duration: kDurationSecs(5),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      action: action,
      elevation: 1.5,
    ),
  );
}
