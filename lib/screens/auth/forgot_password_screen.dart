// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/auth/otp_screen.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/services/email.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/animations.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/loader.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  int otp = 0;
  bool isLoading = false;


  processForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      // Check if email exists in database first

      otp = await EmailService().sendOtp(context, email);

      setState(() {
        isLoading = false;
      });
      if (otp != 0) {

        logger(otp);
        navigatorPush(context, OTPScreen(email: email, otp: otp,));
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: '',
      padding: kAppPadding().copyWith(top: 60.r),
      screen: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              children: [
                const Image(
                  image: AssetImage('assets/vectors/forgot_password.png')
                ),
                SizedBox(height: 20.h),
                Text(
                  'Forgot Password?',
                  style: kAppbarTextStyle(context),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Enter your email then we will send you OTP mail to reset new password.',
                  style: kSecondaryNormalTextStyle(context),
                  textAlign: TextAlign.center,
                ),
              ].animate(interval: kDurationMs(300), effects: MyEffects.fadeSlide()),
            ),
        
            SizedBox(height: 20.h),

            EmailTextField(
              onChanged: (value) {
                setState(() {
                  email = value!;
                });
              }, 
              enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
              focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
              errorBorderColor: kSemanticRed, 
              focusedErrorBorderColor: kSemanticRed, 
              errorTextStyleColor: kSemanticRed, 
              iconColor: kMainColor(context), 
              cursorColor: kMainColor(context),
              filled: true,
              fillColor: kScaffoldBgColor(context),
            ).animate(
                delay: kDurationMs(1500),
              ).slideX(duration: kDurationMs(500), begin: -0.5, end: 0.0)
              .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),
        
            SizedBox(height: 10.h),
        
            isLoading ? const Loader() : Button(
              width: double.infinity,
              buttonText: 'Send OTP', 
              onPressed: processForm, 
              buttonColor: kPrimaryColor, 
              textColor: kNeutralLight,
              inactive: false,
            ).animate(delay: kDurationSecs(2))
            .scaleY(duration: kDurationMs(500), begin: 0.0, end: 1.0),
          ]
        ),
      ),
    );
  }
}