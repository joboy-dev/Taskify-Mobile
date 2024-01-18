import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/onboarding/splash_screen.dart';
import 'package:taskify/shared/constants.dart';

void main() {

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:  (context) => const Taskify(),
    )
  );
}

class Taskify extends StatelessWidget {
  const Taskify({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taskify',
        home: const SplashScreen(),
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: kNeutralLight,
          splashColor: kMainColor(context).withOpacity(0.1),
          shadowColor: kNeutralDarkGrey,
          applyElevationOverlayColor: false,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: kNeutralDark,
          splashColor: kMainColor(context).withOpacity(0.1),
          shadowColor: kNeutralLightGrey,
          applyElevationOverlayColor: false,
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}

