import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/bottom_navbar.dart';
import 'package:taskify/shared/widgets/button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Choose plan',
      titleFontSize: 16.sp,
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 500.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose plan',
                  style: kNormalTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Unlock more features with premium and enterprise',
                  style: kSecondaryNormalTextStyle(context).copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),

              ],
            ),
          ),

          Button(
            width: double.infinity,
            buttonText: 'Continue', 
            onPressed: () {
              navigatorPushReplacement(context, const BottomNavbar());
            }, 
            buttonColor: kPrimaryColor, 
            textColor: kNeutralLight,
            inactive: false,
          )
        ],
      ),
    );
  }
}