import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:taskify/core/constants/constants.dart';

class MyEffects {
  static List<Effect> fadeSlide({Offset offset= const Offset(0, -0.2)}) => [
    FadeEffect(duration: kDurationMs(700)),
    SlideEffect(duration: kDurationMs(700), begin: offset),
  ];

  static List<Effect> slideShake({Offset offset= const Offset(0, -0.1)}) => [
    SlideEffect(duration: kDurationMs(500), begin: offset),
    ShakeEffect(duration: kDurationMs(500)),
  ];
}
