import 'package:flutter/material.dart';

navigatorPop(BuildContext context, {dynamic result}) {
  Navigator.of(context).pop(result);
}

navigatorPushReplacement(BuildContext context, Widget screen, {double dx=0.0, double dy=1.0}) {
  Navigator.of(context).pushReplacement(screenRoute(screen, dx, dy));
}

navigatorPush(BuildContext context, Widget screen, {double dx=0.0, double dy=1.0}) {
  Navigator.of(context).push(screenRoute(screen, dx, dy));
}

Route screenRoute(Widget screen, double dx, double dy) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Offset begin = Offset(dx, dy);
      // Offset end = Offset.zero;
      // final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut)); 
      // final offsetAnimation = animation.drive(tween);

      var tween = Tween(begin: 0.0, end: 1.0);
      final scaleAnimation = animation.drive(tween);

      return ScaleTransition(
        scale: scaleAnimation,
        child: child
      );
    },
  );
}


noEffectNavigatorPop(BuildContext context) {
  Navigator.of(context).pop();
}

noEffectNavigatorPushReplacement(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(noEffectScreenRoute(screen));
}

noEffectNavigatorPush(BuildContext context, Widget screen) {
  Navigator.of(context).push(noEffectScreenRoute(screen));
}

Route noEffectScreenRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
  );
}
