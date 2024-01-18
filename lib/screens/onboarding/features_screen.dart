import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/auth/signin_screen.dart';
import 'package:taskify/screens/auth/signup_screen.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/animations.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({
    super.key, 
    required this.featureId,
  });

  final int featureId;

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  String imagePath = '';
  String headText = '';
  String subtext = '';

  @override
  void initState() {
    if (widget.featureId == 1) {
      setState(() {
        imagePath = 'assets/images/feature1.png'; 
        headText = 'Welcome to Taskify'; 
        subtext = 'Welcome !!! Do you want to clear task super fast with Taskify?';
      });
    } else if(widget.featureId == 2) {
      setState(() {
        imagePath = 'assets/images/feature2.png'; 
        headText = 'Ease of Use'; 
        subtext = 'Easily arrange work order for you to mange. Many functions to choose.';
      });
    } else {
      setState(() {
        imagePath = 'assets/images/feature3.png'; 
        headText = 'Get Started'; 
        subtext = 'It has never been easier to complete tasks. Get started with us!';
      });
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: false,
      padding: kAppPadding().copyWith(top: 60.r),
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 340.w,
            height: 340.h,
            fit: BoxFit.cover,
          ).animate()
          .fade(duration: kDurationSecs(1))
          .slide(duration: kDurationSecs(2), curve: Curves.ease, begin: const Offset(0.1, -0.1), end: const Offset(0.0, 0.0)),
          
          SizedBox(height: 20.h),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Column(
                  children: [
                    Text(
                      headText, 
                      style: kNormalTextStyle(context).copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ).animate()
                    .fade(duration: kDurationSecs(1)),
                    
                    SizedBox(height: 10.h),
                
                    Text(
                      subtext, 
                      style: kNormalTextStyle(context).copyWith(
                        color: kMainColor(context).withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ).animate()
                    .fade(duration: kDurationSecs(1)),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
          
              widget.featureId == 3 ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    width: double.infinity,
                    buttonText: 'Get Started', 
                    onPressed: () {
                      navigatorPush(context, const SignUpScreen());
                    }, 
                    buttonColor: kPrimaryColor, 
                    textColor: kNeutralLight,
                    inactive: false,
                  ).animate()
                  .scaleY(duration: kDurationMs(500), begin: 0.0, end: 1.0),

                  SizedBox(height: 20.h),
                  
                  ButtonText(
                    firstText: 'Already have an account? ', 
                    secondText: 'Sign In', 
                    onTap: () {
                      navigatorPush(context, const SignInScreen());
                    },
                  ).animate(effects: MyEffects.fadeSlide(), delay: kDurationMs(500)),
                ],
              )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (widget.featureId == 1) {
                              noEffectNavigatorPushReplacement(context, const FeaturesScreen(featureId: 2));
                            } else if(widget.featureId == 2) {
                              noEffectNavigatorPushReplacement(context, const FeaturesScreen(featureId: 3));
                            }
                          }, 
                          icon: Icon(Icons.arrow_forward_ios, size: 20.w,),
                          color: kNeutralLight,
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            fixedSize: Size(60.w, 60.h),
                            backgroundColor: kPrimaryColor,
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            navigatorPush(context, const SignUpScreen());
                          }, 
                          child: Text(
                            'Skip',
                            style: kSecondaryNormalTextStyle(context).copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                            ),
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: List.generate(
                        3, (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.r),
                          child: Container(
                            height: 8.h,
                            width: index == widget.featureId - 1 ? 24.w : 8.w,
                            decoration: BoxDecoration(
                              color: index == widget.featureId - 1 ? kPrimaryColor : kNeutralLightGrey,
                              borderRadius: BorderRadius.circular(10.r)
                            ),
                          ),
                        )
                      ),
                    ),
                  ],
              )
            ],
          ),

        ]
      ),
    );
  }
}