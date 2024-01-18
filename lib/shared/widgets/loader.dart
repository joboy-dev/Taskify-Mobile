import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taskify/shared/constants.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size, this.color});

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitPouringHourGlassRefined(
      color: color ?? kSecondaryColor,
      // duration: kDurationSecs(3),
      size: size ?? 36.r,
    ).animate().fadeIn();
  }
}
