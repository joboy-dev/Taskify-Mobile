import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/auth/signin_screen.dart';
import 'package:taskify/screens/auth/signup/other_details_screen.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/animations.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/snackbar.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class EmailPasswordScreen extends StatefulWidget {
  const EmailPasswordScreen({super.key});

  @override
  State<EmailPasswordScreen> createState() => _EmailPasswordScreenState();
}

class _EmailPasswordScreenState extends State<EmailPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String password2 = '';

  bool obscureText = true;
  bool obscureText2 = true;

  processForm() {
    if (_formKey.currentState!.validate()) {
      if (password == password2) {
        navigatorPush(context, OtherFieldsScreen(email: email, password: password,));
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: kAppbarTextStyle(context),
                ),
                SizedBox(width: 5.w),
                const Image(
                  image: AssetImage('assets/vectors/bubble.png'),
                )
              ],
            ).animate(effects: MyEffects.fadeSlide()),
        
            SizedBox(height: 40.h),

            Column(
              children: [

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
                ),
            
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
              ).slideX(duration: kDurationMs(500), begin: -0.1, end: 0.0)
              .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),
            ),
        
        
            SizedBox(height: 10.h),
        
            Button(
              width: double.infinity,
              buttonText: 'Continue', 
              onPressed: processForm, 
              buttonColor: kPrimaryColor, 
              textColor: kNeutralLight,
              inactive: false,
            ).animate(delay: kDurationMs(2500))
            .scaleY(duration: kDurationMs(500), begin: 0.0, end: 1.0),

            SizedBox(height: 40.h),

            ButtonText(
              firstText: 'Already have an account? ', 
              secondText: 'Sign In', 
              onTap: () {
                navigatorPushReplacement(context, const SignInScreen());
              },
            ).animate(effects: MyEffects.fadeSlide(), delay: kDurationMs(3000)),
          ],
        ),
      ),
    );
  }
}