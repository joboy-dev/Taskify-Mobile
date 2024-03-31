// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/general/presentation/pages/base_screen.dart';
import 'package:taskify/features/general/presentation/widgets/button.dart';
import 'package:taskify/features/general/presentation/widgets/snackbar.dart';
import 'package:taskify/features/general/presentation/widgets/textfield.dart';
import 'package:taskify/features/user/presentation/pages/reset_password_screen.dart';
import 'package:taskify/core/helpers/email.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/animations.dart';
import 'package:taskify/core/helpers/logger.dart';
import 'package:taskify/core/helpers/navigator.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.email, required this.otp});
  
  final String email;
  int otp;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();

  String otpCode = '';
  int secondsToResend = 60;
  bool showResendButton = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    updateSecondsToResend();
  }

  updateSecondsToResend() {
    _timer = Timer.periodic(kDurationSecs(1), (timer) {
      setState(() {
        secondsToResend -= 1;
      });

      if (secondsToResend == 0) {
        setState(() {
          showResendButton = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  processForm(String otp) {
    logger(widget.otp);
    logger(otp);
    setState(() {
      otpCode = otp;
    });


    if (widget.otp.toString() == otpCode) {
      showSnackbar(context, 'The OTP entered is correct. Proceed to reset your password');
      navigatorPushReplacement(context, ResetPasswordScreen(userEmail: widget.email, showOldPasswordField: false,));
    } else {
      showSnackbar(context, 'The OTP entered is not valid');
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
                  image: AssetImage('assets/vectors/otp.png')
                ),
                SizedBox(height: 20.h),
                Text(
                  'Enter OTP',
                  style: kAppbarTextStyle(context),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Enter the OTP we just sent to your phone then start reset your new password.',
                  style: kSecondaryNormalTextStyle(context),
                  textAlign: TextAlign.center,
                ),
              ].animate(interval: kDurationMs(300), effects: MyEffects.fadeSlide()),
            ),
        
            SizedBox(height: 20.h),

            PinField(
              onChange: (value) {
                setState(() {
                  otpCode = value;
                });
              }, 
              oncomplete: (pincode) {
                processForm(pincode);
              },
            ).animate(
              delay: kDurationMs(1500)
            ).slideX(duration: kDurationMs(500), begin: -0.5, end: 0.0)
              .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),

            SizedBox(height: 15.h),

            showResendButton ? const SizedBox() : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend OTP ',
                  style: kNormalTextStyle(context).copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  'in ${secondsToResend}s',
                  style: kSecondaryNormalTextStyle(context).copyWith(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ).animate(delay: kDurationSecs(2))
            .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),

            SizedBox(height: 20.h),
        
            showResendButton ? Button(
              width: double.infinity,
              buttonText: 'Resend OTP', 
              onPressed: () async {
                setState(() {
                  showResendButton = false;
                  secondsToResend = 60;
                });
                widget.otp = await EmailService().sendOtp(context, widget.email);

                logger('Resemt OTP: ${widget.otp}');

                updateSecondsToResend();
              }, 
              buttonColor: kPrimaryColor, 
              textColor: kNeutralLight,
              inactive: false,
            ).animate(delay: kDurationSecs(2))
            .scaleY(duration: kDurationMs(500), begin: 0.0, end: 1.0) : const SizedBox(),
          ]
        ),
      ),
    );
  }
}