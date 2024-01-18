import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/navigator.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final Color borderColor;
  final bool inactive;
  final double? width;
  final double? height;
  final double? buttonFontSize;
  final Color? textColor;
  final double? borderRadius;
  final String? fontFamily;

  const Button({
    super.key, 
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.inactive,
    this.borderColor=Colors.transparent,
    this.width,
    this.height,
    this.buttonFontSize,
    this.textColor,
    this.borderRadius,
    this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? 200.w,
      height: height ?? 48.h,
      color: inactive ? kNeutralLightGrey.withOpacity(0.1) : buttonColor,
      focusColor: inactive
          ? kNeutralLightGrey.withOpacity(0.5)
          : buttonColor.withOpacity(0.5),
      elevation: inactive ? 1.0 : 2.0,
      focusElevation: inactive ? 1.0 : 2.0,
      splashColor: inactive
          ? kNeutralLightGrey.withOpacity(0.05)
          : buttonColor.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        side: BorderSide(color: borderColor, width: 1.w)
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? kPrimaryColor,
          fontSize: buttonFontSize ?? 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily ?? kFontFamily,
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  final String firstText, secondText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        splashColor: kPrimaryColor.withOpacity(0.1),
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: kNormalTextStyle(context).copyWith(
              fontSize: 15.sp, 
              color: kNeutralDarkGrey, // match with dark mode
            ),
            children: [
              TextSpan(
                text: secondText,
                style: kNormalTextStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
    required this.inactiveButton,
    required this.button2Text,
    required this.button2Color,
    required this.button2onPressed,
  });

  final bool inactiveButton;
  final String button2Text;
  final Color button2Color;
  final Function() button2onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Button(
            buttonText: 'Cancel',
            onPressed: () {
              navigatorPop(context);
            },
            buttonColor: kRedColor,
            textColor: kSecondaryColor,
            inactive: false,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Button(
            buttonText: button2Text,
            onPressed: button2onPressed,
            buttonColor: button2Color,
            inactive: inactiveButton,
            textColor: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.text,
    this.iconWidget,
    required this.onPressed,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.iconsize,
    this.trailing,
    this.padding
  });

  final String text;
  final Widget? iconWidget;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? iconsize;
  final Widget? trailing;
  final EdgeInsets? padding;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: kScaffoldBgColor(context),
      child: Padding(
        padding: padding ?? EdgeInsets.only(left: 0.r, bottom: 5.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 0, child: iconWidget ?? SizedBox(width: 0.w,)),
            if(iconWidget != null) SizedBox(width: 20.sp),
            Expanded(
              flex: 1,
              child: Text(
                text,
                style: kNormalTextStyle(context).copyWith(
                  fontSize: fontSize ?? 20.sp,
                  color: textColor ?? kMainColor(context), // adapt with darkmode
                  fontWeight: fontWeight ?? FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: trailing ?? const SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}


class ButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final Color borderColor;
  final bool inactive;
  final double? width;
  final double? height;
  final double? buttonFontSize;
  final Color? textColor;
  final double? borderRadius;
  final String? fontFamily;
  final IconData icon;

  const ButtonWithIcon({
    super.key, 
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.inactive,
    this.borderColor=Colors.transparent,
    this.width,
    this.height,
    this.buttonFontSize,
    this.textColor,
    this.borderRadius,
    this.fontFamily,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? 200.w,
      height: height ?? 48.h,
      color: inactive ? kNeutralLightGrey.withOpacity(0.1) : buttonColor,
      focusColor: inactive
          ? kNeutralLightGrey.withOpacity(0.5)
          : buttonColor.withOpacity(0.5),
      elevation: 0.0,
      focusElevation: 0.0,
      splashColor: inactive
          ? kNeutralLightGrey.withOpacity(0.05)
          : buttonColor.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        side: BorderSide(color: borderColor, width: 2.w)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30.r,),
          SizedBox(width: 20.w),
          Text(
            buttonText,
            style: TextStyle(
              color: textColor ?? kPrimaryColor,
              fontSize: buttonFontSize ?? 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily ?? kFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        
      }, 
      icon: Icon(Icons.add, size: 20.w,),
      color: kNeutralLight,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r))
        ),
        fixedSize: Size(45.w, 40.h),
        backgroundColor: kScaffoldBgColor(context) == kNeutralDark ? kSecondaryColor : kPrimaryColor,
      ),
    );
  }
}