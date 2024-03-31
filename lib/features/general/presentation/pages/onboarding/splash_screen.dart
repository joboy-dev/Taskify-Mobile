// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/features/general/presentation/pages/onboarding/features_screen.dart';
import 'package:taskify/features/notification/presentation/providers/notifications_provider.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/navigator.dart';

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
            final notifications = NotificationsProvider();

            await Future.delayed(kDurationSecs(2));
            navigatorPushReplacement(context, const FeaturesScreen(featureId: 1));
          },
        ).slideY(duration: kDurationSecs(3), begin: 10.0, end: 0.0)
        .fade(duration: kDurationSecs(4))
      ),
    );
  }
}