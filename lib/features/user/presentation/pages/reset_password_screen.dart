import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/general/presentation/pages/base_screen.dart';
import 'package:taskify/features/general/presentation/widgets/button.dart';
import 'package:taskify/features/general/presentation/widgets/snackbar.dart';
import 'package:taskify/features/general/presentation/widgets/textfield.dart';
import 'package:taskify/features/user/presentation/pages/signin_screen.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/animations.dart';
import 'package:taskify/core/helpers/navigator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.userEmail, required this.showOldPasswordField});

  final String userEmail;
  final bool showOldPasswordField;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String password = '';
  String password2 = '';
  String password3 = '';

  bool obscureText = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  processForm() {
    if (_formKey.currentState!.validate()) {
      if (password == password2) {
        navigatorPushReplacement(context, const SignInScreen());
      } else {
        showSnackbar(context, 'Passwords do not match.');
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/vectors/reset_password.png'),
                ),
                SizedBox(height: 20.w),
                Text(
                 widget.showOldPasswordField ?  'Change Password' : 'Reset Password',
                  style: kAppbarTextStyle(context),
                ),
              ],
            ).animate(effects: MyEffects.fadeSlide()),
        
            SizedBox(height: 20.h),

            Column(
              children: [
                widget.showOldPasswordField ? NormalTextField(
                  hintText: 'Old Password',
                  onChanged: (value) {
                    setState(() {
                      password3 = value!;
                    });
                  }, 
                  enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
                  focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
                  errorBorderColor: kSemanticRed, 
                  focusedErrorBorderColor: kSemanticRed, 
                  errorTextStyleColor: kSemanticRed, 
                  prefixIcon: Icons.lock_outline,
                  iconColor: kMainColor(context), 
                  cursorColor: kMainColor(context),
                  filled: true,
                  fillColor: kScaffoldBgColor(context),
                  obscureText: obscureText3,
                  suffixIcon: obscureText3 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  suffixIconOTap: () {
                    setState(() {
                      obscureText3 = !obscureText3;
                    });
                  },
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    return RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value!)
                        ? null
                        : 'Your password should have an uppercase letter, lowercase letter, a symbol and number';
                  },
                ) : const SizedBox(),

                NormalTextField(
                  hintText: 'Password',
                  onChanged: (value) {
                    setState(() {
                      password = value!;
                    });
                  }, 
                  enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
                  focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
                  errorBorderColor: kSemanticRed, 
                  focusedErrorBorderColor: kSemanticRed, 
                  errorTextStyleColor: kSemanticRed, 
                  prefixIcon: Icons.lock_outline,
                  iconColor: kMainColor(context), 
                  cursorColor: kMainColor(context),
                  filled: true,
                  fillColor: kScaffoldBgColor(context),
                  obscureText: obscureText,
                  suffixIcon: obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  suffixIconOTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    return RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value!)
                        ? null
                        : 'Your password should have an uppercase letter, lowercase letter, a symbol and number';
                  },
                ),
            
                NormalTextField(
                  hintText: 'Re-enter password',
                  onChanged: (value) {
                    setState(() {
                      password2 = value!;
                    });
                  }, 
                  enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
                  focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
                  errorBorderColor: kSemanticRed, 
                  focusedErrorBorderColor: kSemanticRed, 
                  errorTextStyleColor: kSemanticRed, 
                  prefixIcon: Icons.lock_outline,
                  iconColor: kMainColor(context), 
                  cursorColor: kMainColor(context),
                  filled: true,
                  fillColor: kScaffoldBgColor(context),
                  obscureText: obscureText2,
                  suffixIcon: obscureText2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  suffixIconOTap: () {
                    setState(() {
                      obscureText2 = !obscureText2;
                    });
                  },
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    return RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value!)
                        ? null
                        : 'Your password should have an uppercase letter, lowercase letter, a symbol and number';
                  },
                ),
              ].animate(
                interval: kDurationMs(500),
                delay: kDurationSecs(1),
              ).slideX(duration: kDurationMs(500), begin: -0.5, end: 0.0)
              .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),
            ),
        
            SizedBox(height: 10.h),
        
            Button(
              width: double.infinity,
              buttonText: 'Save Changes', 
              onPressed: processForm, 
              buttonColor: kPrimaryColor, 
              textColor: kNeutralLight,
              inactive: false,
            ).animate(delay: kDurationMs(2500))
            .scaleY(duration: kDurationMs(500), begin: 0.0, end: 1.0),
          ],
        ),
      ),
    );
  }
}