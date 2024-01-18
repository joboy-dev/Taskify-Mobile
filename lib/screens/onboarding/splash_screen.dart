// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/onboarding/features_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/navigator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage('assets/images/logo.png'),
          height: 100.h,
          width: 100.h,
          fit: BoxFit.cover,
        ).animate(
          onComplete: (controller) async {
            await Future.delayed(kDurationSecs(2));
            navigatorPushReplacement(context, const FeaturesScreen(featureId: 1));
          },
        ).slideY(duration: kDurationSecs(3), begin: 10.0, end: 0.0)
        .fade(duration: kDurationSecs(4))
      ),
    );
  }
}