import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/navigator.dart';
import 'package:taskify/features/general/presentation/pages/base_screen.dart';
import 'package:taskify/features/general/presentation/widgets/bottom_navbar.dart';
import 'package:taskify/features/general/presentation/widgets/button.dart';
import 'package:taskify/features/general/presentation/widgets/snackbar.dart';

class VerifyEmailAddressScreen extends StatefulWidget {
  const VerifyEmailAddressScreen({super.key});

  @override
  State<VerifyEmailAddressScreen> createState() => _VerifyEmailAddressScreenState();
}

class _VerifyEmailAddressScreenState extends State<VerifyEmailAddressScreen> {
  bool emailVerified = true;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Verify email address',
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
                  'Verify email',
                  style: kNormalTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Check your email and click the verification link to continue to the application',
                  style: kSecondaryNormalTextStyle(context).copyWith(
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
              emailVerified 
                ? navigatorPushReplacement(context, const BottomNavbar())
                : showSnackbar(context, 'Your email has not been verified yet.');
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