import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kFontFamily = 'PlusJakartaSans';

Color kPrimaryColor = const Color(0xFF643fdb);
Color kSecondaryColor =const  Color(0xFFff8a00);

// Neutral Colors
Color kNeutralLight =const  Color(0xFFffffff);
Color kNeutralDark = const Color(0xFF1c1243);
Color kNeutralDarkGrey = const Color(0xFFa29eb6);
Color kNeutralLightGrey = const Color(0xFFeff1f3);

// Semantic Colors
Color kSemanticRed = const Color(0xFFff6a5d);
Color kSemanticGreen = const Color(0xFF47c272);

// Overlay Colors
Color kOverlayPink = const Color(0xFFe15a93);
Color kOverlayOrange = const Color(0xFFff6a5d);
Color kOverlayPurple = const Color(0xFFb37be7);
Color kOverlayGreen = const Color(0xFFdeeded);
Color kOverlayYellow = const Color(0xFFffe7cc);
Color kOverlayLightPink = const Color(0xFFf4d8e8);
Color kOverlayLightOrange = const Color(0xFFffd7d4);
Color kOverlayLightNeutralDark = kNeutralDark.withOpacity(0.8);

const kRedColor = Color.fromARGB(255, 206, 15, 15);
Color kScaffoldBgColor(BuildContext context) => Theme.of(context).scaffoldBackgroundColor;

double kBorderRadius = 16.r;

// THEME BASED FONT COLOR
Color kMainColor(BuildContext context) {
  // Check the scaffold background color to determins which colors to render
  if (kScaffoldBgColor(context) == kNeutralDark) {
    return kNeutralLight;
  } else {
    return kNeutralDark;
  }
}

// RESPONSIVENESS
Size kHeightWidth(BuildContext context) {
  return MediaQuery.of(context).size;
}

EdgeInsets kAppPadding() => EdgeInsets.only(left: 24.r, right: 24.r, top: 10.r);

// ANIMATION DURATION
Duration kDurationMs(int ms) => Duration(milliseconds: ms);
Duration kDurationSecs(int seconds) => Duration(seconds: seconds);

// TEXT STYLES
TextStyle kAppbarTextStyle(BuildContext context) => TextStyle(fontWeight: FontWeight.bold, fontFamily: kFontFamily, fontSize: 22.sp, color: kMainColor(context));
TextStyle kNavbarTextStyle() => TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, fontFamily:  kFontFamily);
TextStyle kTextFieldTextStyle(BuildContext context) => TextStyle(fontSize: 16.sp, color: kMainColor(context), fontFamily: kFontFamily);

TextStyle kNormalTextStyle(BuildContext context) => TextStyle(fontSize: 14.sp, color: kMainColor(context), fontFamily: kFontFamily);
TextStyle kSecondaryNormalTextStyle(BuildContext context) => TextStyle(fontSize: 14.sp, color: kNeutralDarkGrey, fontFamily: kFontFamily);
