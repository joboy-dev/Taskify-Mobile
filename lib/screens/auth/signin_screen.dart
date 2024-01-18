import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/auth/forgot_password_screen.dart';
import 'package:taskify/screens/auth/signup_screen.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/animations.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/bottom_navbar.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool obscureText = true;

  processForm() {
    if (_formKey.currentState!.validate()) {
      navigatorPushReplacement(context, const BottomNavbar());
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
                  'Sign In',
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
              ].animate(
                interval: kDurationMs(500),
                delay: kDurationSecs(1),
              ).slideX(duration: kDurationMs(500), begin: -0.1, end: 0.0)
              .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    navigatorPush(context, const ForgotPasswordScreen());
                  },
                  child: Text(
                    'Forgot Password?', 
                    style: kNormalTextStyle(context).copyWith(color: kSecondaryColor),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ).animate(
              delay: kDurationMs(1500)
            ).slideX(duration: kDurationMs(500), begin: 0.1, end: 0.0)
              .fade(duration: kDurationMs(500), begin: 0.0, end: 1.0),
        
            SizedBox(height: 20.h),
        
            Button(
              width: double.infinity,
              buttonText: 'Sign In', 
              onPressed: processForm, 
              buttonColor: kPrimaryColor, 
              textColor: kNeutralLight,
              inactive: false,
            ).animate(delay: kDurationSecs(2))
            .scaleY(duration: kDurationMs(500), begin: 0.0, end: 1.0),

            SizedBox(height: 40.h),

            ButtonText(
              firstText: 'Don\'t have an account? ', 
              secondText: 'Sign Up', 
              onTap: () {
                navigatorPushReplacement(context, const SignUpScreen());
              },
            ).animate(effects: MyEffects.fadeSlide(), delay: kDurationMs(2500))
          ]
        ),
      ),
    );
  }
}