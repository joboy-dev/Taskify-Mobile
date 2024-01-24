import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/auth/signin_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';

class DeleteAccountSheet extends StatelessWidget {
  const DeleteAccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Are you sure you want to delete your account? You will not be able to recover your data.',
          style: kNormalTextStyle(context).copyWith(
            fontSize: 16.sp
          ),
        ),
        SizedBox(height: 20.h),

        DoubleButton(
          inactiveButton: false, 
          button2Text: 'Delete', 
          button2Color: kSecondaryColor, 
          button2onPressed: () {
            navigatorPushReplacement(context, const SignInScreen());
          },
        )
      ],
    );
  }
}