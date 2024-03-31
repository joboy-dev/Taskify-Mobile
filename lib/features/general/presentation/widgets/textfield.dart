import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.focusedErrorBorderColor,
    required this.errorTextStyleColor,
    required this.iconColor,
    required this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.readonly,
    this.fontSize,
    this.textInputType,
    this.textColor,
    this.suffixIconOTap,
    this.labelText,
    this.maxLines,
    this.fillColor,
    this.filled=false,
    this.borderRadius,
    this.validator,
    this.contentPadding,
  });

  final String? initialValue;
  final String? labelText;
  final String hintText;
  final bool? readonly;
  final Function(String? value) onChanged;
  final Function()? suffixIconOTap;
  final String? Function(String? value)? validator;
  final Color enabledBorderColor;
  final bool obscureText;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color iconColor;
  final Color cursorColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? fontSize;
  final TextInputType? textInputType;
  final int? maxLines;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? Text(
            labelText!,
            style: kNormalTextStyle(context).copyWith(
              fontSize: 16.sp,
              color: kMainColor(context),
              fontWeight: FontWeight.bold
            ),
          ) : const SizedBox(),

          labelText != null ? SizedBox(height: 10.h,) : const SizedBox(),

          Container(
            decoration: BoxDecoration(
              boxShadow: kScaffoldBgColor(context) == kNeutralDark ? [] : [
                BoxShadow(
                  color: kNeutralLightGrey,
                  blurRadius: 8.r,
                  spreadRadius: 4.r,
                  offset: const Offset(-0.5, 1.0)
                ),
              ]
            ),
            child: TextFormField(
              readOnly: readonly ?? false,
              initialValue: initialValue,
              minLines: 1,
              maxLines: maxLines ?? 1,
              style: kNormalTextStyle(context).copyWith(
                fontSize: fontSize ?? 15.sp, 
                color: textColor ?? kMainColor(context),
              ),
              cursorColor: cursorColor,
              obscureText: obscureText,
              keyboardType: textInputType ?? TextInputType.text,
              decoration: InputDecoration(
                contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
                hintText: hintText,
                filled: filled,
                fillColor: fillColor,
                hintStyle: kTextFieldTextStyle(context).copyWith(
                  color: kMainColor(context).withOpacity(0.5),
                ),
                prefixIcon: prefixIcon != null ? Padding(
                  padding: EdgeInsets.only(right: 16.r, left: 24.r),
                  child: Icon(
                    prefixIcon,
                    color: iconColor,
                    size: 24.r,
                  ),
                ) : const SizedBox(width: 0,),
                suffixIcon: GestureDetector(
                  onTap: suffixIconOTap ?? () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.r),
                    child: Icon(suffixIcon, color: kMainColor(context), size: 24.r,),
                  ),
                ),
                // labelText: labelText ?? hintText,
                // labelStyle: TextStyle(
                //   color: kFontTheme(context).withOpacity(0.5),
                //   fontWeight: FontWeight.normal,
                //   fontSize: 15.sp,
                // ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: errorBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorStyle: TextStyle(
                  color: errorTextStyleColor,
                  fontSize: 15.sp,
                ),
              ),
              // onSaved: onSaved,
              onChanged: onChanged,
              validator: validator ??  (value) {
                if (value!.isEmpty ) {
                  return 'This field cannot be empty';
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class NormalTextFieldNoPrefixIcon extends StatelessWidget {
  const NormalTextFieldNoPrefixIcon({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.focusedErrorBorderColor,
    required this.errorTextStyleColor,
    required this.iconColor,
    required this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.readonly,
    this.fontSize,
    this.textInputType,
    this.textColor,
    this.suffixIconOTap,
    this.labelText,
    this.maxLines,
    this.fillColor,
    this.filled=false,
    this.borderRadius,
    this.validator,
    this.contentPadding,
    this.showShadow = true
  });

  final String? initialValue;
  final String? labelText;
  final String hintText;
  final bool? readonly;
  final Function(String? value) onChanged;
  final Function()? suffixIconOTap;
  final String? Function(String? value)? validator;
  final Color enabledBorderColor;
  final bool obscureText;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color iconColor;
  final Color cursorColor;
  final IconData? prefixIcon;
  // final String? suffixIcon;
  final IconData? suffixIcon;
  final double? fontSize;
  final TextInputType? textInputType;
  final int? maxLines;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool? showShadow;
  // Function(String? newValue) onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? Text(
            labelText!,
            style: kNormalTextStyle(context).copyWith(
              fontSize: 16.sp,
              color: kMainColor(context),
              fontWeight: FontWeight.bold
            ),
          ) : const SizedBox(),
          labelText != null ? SizedBox(height: 10.h,) : const SizedBox(),
          Container(
            decoration: BoxDecoration(
              boxShadow: !showShadow! ? [] : kScaffoldBgColor(context) == kNeutralDark ? [] : [
                BoxShadow(
                  color: kNeutralLightGrey,
                  blurRadius: 8.r,
                  spreadRadius: 4.r,
                  offset: const Offset(-0.5, 1.0)
                ),
              ]
            ),
            child: TextFormField(
              readOnly: readonly ?? false,
              initialValue: initialValue,
              minLines: 1,
              maxLines: maxLines ?? 1,
              style: kNormalTextStyle(context).copyWith(
                fontSize: fontSize ?? 15.sp, 
                color: textColor ?? kMainColor(context),
              ),
              cursorColor: cursorColor,
              obscureText: obscureText,
              keyboardType: textInputType ?? TextInputType.text,
              decoration: InputDecoration(
                contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16.sp),
                hintText: hintText,
                filled: filled,
                fillColor: fillColor,
                hintStyle: kTextFieldTextStyle(context).copyWith(
                  color: kMainColor(context).withOpacity(0.5),
                ),
                suffixIcon: GestureDetector(
                  onTap: suffixIconOTap ?? () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.r),
                    child: Icon(suffixIcon, color: kMainColor(context), size: 16.sp,),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: errorBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorStyle: TextStyle(
                  color: errorTextStyleColor,
                  fontSize: 15.sp,
                ),
              ),
              // onSaved: onSaved,
              onChanged: onChanged,
              validator: validator ??  (value) {
                if (value!.isEmpty ) {
                  return 'This field cannot be empty';
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key, 
    this.initialValue,
    this.readOnly,
    required this.onChanged,
    required this.iconColor, 
    this.enabledBorderColor, 
    this.focusedBorderColor, 
    this.errorBorderColor, 
    this.focusedErrorBorderColor, 
    required this.errorTextStyleColor, 
    required this.cursorColor,
    this.borderRadius,
    this.labelText,
    this.hintText,
    this.contentPadding, 
    this.filled, 
    this.fillColor,
  });

  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final bool? readOnly;
  final bool? filled;
  final Color iconColor;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color cursorColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? Text(
            labelText!,
            style: kNormalTextStyle(context).copyWith(
              fontSize: 16.sp,
              color: kMainColor(context),
              fontWeight: FontWeight.bold
            ),
          ) : const SizedBox(),
          labelText != null ? SizedBox(height: 10.h,) : const SizedBox(),

          Container(
            decoration: BoxDecoration(
              boxShadow: kScaffoldBgColor(context) == kNeutralDark ? [] : [
                BoxShadow(
                  color: kNeutralLightGrey,
                  blurRadius: 8.r,
                  spreadRadius: 4.r,
                  offset: const Offset(-0.5, 1.0)
                ),
              ]
            ),
            child: TextFormField(
              readOnly: readOnly ?? false,
              initialValue: initialValue,
              cursorColor: cursorColor,
              keyboardType: TextInputType.emailAddress,
              style: kTextFieldTextStyle(context).copyWith(
                fontSize: 15.sp, 
                color: kMainColor(context),
              ),
              decoration: InputDecoration(
                hintText: hintText ?? 'Email',
                hintStyle: kTextFieldTextStyle(context).copyWith(
                  color: kMainColor(context).withOpacity(0.5),
                ),
                contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
                filled: filled,
                fillColor: fillColor,
                // labelText: labelText ?? 'Email',
                // labelStyle: TextStyle(
                //   color: kMainColor(context).withOpacity(0.5),
                //   fontWeight: FontWeight.normal,
                //   fontSize: 15.sp,
                // ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 16.r, left: 24.r),
                  child: Icon(
                    Icons.email_outlined,
                    color: iconColor,
                    size: 24.r,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: enabledBorderColor ?? Colors.transparent, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusedBorderColor ?? Colors.transparent, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorBorderColor ?? Colors.transparent, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusedErrorBorderColor ?? Colors.transparent, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorStyle: TextStyle(
                  color: errorTextStyleColor,
                  fontSize: 15.sp,
                ),
              ),
              onChanged: onChanged,
              validator: (value) {
                return RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)
                    ? null
                    : 'Please enter a valid email';
              },
            ),
          ),
        ],
      ),
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.onChanged
  });

  final String hintText;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return NormalTextField(
      hintText: hintText, 
      onChanged: onChanged, 
      enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
      focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
      errorBorderColor: kRedColor, 
      focusedErrorBorderColor: kRedColor, 
      errorTextStyleColor: kRedColor, 
      iconColor: kMainColor(context), 
      cursorColor: kMainColor(context),
      borderRadius: 16.r,
      filled: true,
      fillColor: kScaffoldBgColor(context),
      prefixIcon: Icons.search,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
    );
  }
}


class PinField extends StatelessWidget {
  const PinField({
    super.key,
    required this.onChange,
    required this.oncomplete,
  });

  final Function(String value) onChange;
  final Function(String pincode) oncomplete;

  @override
  Widget build(BuildContext context) {
    return PinCodeFields(
      length: 4,
      fieldHeight: 70.h,
      fieldWidth: 70.w,
      fieldBorderStyle: FieldBorderStyle.square,
      borderRadius: BorderRadius.circular(16.r),
      fieldBackgroundColor: Colors.transparent,
      activeBackgroundColor: Colors.transparent,
      borderColor: kNeutralLightGrey,
      activeBorderColor: kPrimaryColor,
      obscureText: false,
      // autofocus: true,
      keyboardType: TextInputType.number,
      textStyle: kNormalTextStyle(context).copyWith(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      onComplete: oncomplete,
      onChange: onChange
    );
  }
}


class DropDownFormField extends StatelessWidget {
  const DropDownFormField({
    super.key,
    required this.value,
    required this.items,
    this.labelText,
    this.iconSize,
    this.fontSize,
    this.padding,
    required this.onChanged,
    required this.prefixIcon,
    required this.iconColor, 
    required this.enabledBorderColor, 
    required this.focusedBorderColor, 
    required this.errorBorderColor, 
    required this.focusedErrorBorderColor, 
    required this.errorTextStyleColor,
    this.borderRadius,
    this.filled,
    this.fillColor,
    this.showShadow=true,
  });

  final dynamic value;
  final String? labelText;
  final List<DropdownMenuItem> items;
  final double? fontSize;
  final double? iconSize;
  final EdgeInsets? padding;
  final IconData prefixIcon;
  final Color iconColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final void Function(dynamic value)? onChanged;
  final double? borderRadius;
  final bool? filled;
  final Color? fillColor;
  final bool? showShadow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null ? Text(
          labelText!,
          style: kNormalTextStyle(context).copyWith(
            fontSize: 16.sp,
            color: kMainColor(context),
            fontWeight: FontWeight.bold
          ),
        ) : const SizedBox(),

        labelText != null ? SizedBox(height: 10.h,) : const SizedBox(),
          
        Container(
          decoration: BoxDecoration(
            boxShadow: !showShadow! ? [] : kScaffoldBgColor(context) == kNeutralDark ? [] : [
              BoxShadow(
                color: kNeutralLightGrey,
                blurRadius: 8.r,
                spreadRadius: 4.r,
                offset: const Offset(-0.5, 1.0)
              ),
            ]
          ),
          child: DropdownButtonFormField(
            value: value,
            items: items,
            style: kNormalTextStyle(context).copyWith(fontSize: fontSize ?? 16.sp),
            onChanged: onChanged,
            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 4,
            padding: padding ?? const EdgeInsets.only(bottom: 20.0),
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle: kNormalTextStyle(context).copyWith(
                color: kMainColor(context).withOpacity(0.5), 
                fontSize: fontSize ?? 15.sp,
                fontWeight: FontWeight.normal,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15.r, right: 25.r),
                child: Icon(
                  prefixIcon,
                  color: iconColor,
                  size: iconSize ?? 20.r,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
              ),
              errorStyle: TextStyle(
                color: errorTextStyleColor,
                fontSize: 17.sp,
              ),
              filled: filled,
              fillColor: fillColor,
            ),
            validator: (value) {
              if (value == null) {
                return 'Make a choice';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}


class FieldSection extends StatelessWidget {
  const FieldSection({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: kNormalTextStyle(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),

        child,
        SizedBox(height: 20.h),
      ],
    );
  }
}


class NormalTextFieldWithLength extends StatelessWidget {
  const NormalTextFieldWithLength({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.focusedErrorBorderColor,
    required this.errorTextStyleColor,
    required this.iconColor,
    required this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.readonly,
    this.fontSize,
    this.textInputType,
    this.textColor,
    this.suffixIconOTap,
    this.labelText,
    this.maxLines,
    this.fillColor,
    this.filled=false,
    this.borderRadius,
    this.validator,
    this.contentPadding,
    this.maxLength,
  });

  final String? initialValue;
  final String? labelText;
  final String hintText;
  final bool? readonly;
  final Function(String? value) onChanged;
  final Function()? suffixIconOTap;
  final String? Function(String? value)? validator;
  final Color enabledBorderColor;
  final bool obscureText;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color iconColor;
  final Color cursorColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? fontSize;
  final TextInputType? textInputType;
  final int? maxLines;
  final double? borderRadius;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? Text(
            labelText!,
            style: kNormalTextStyle(context).copyWith(
              fontSize: 16.sp,
              color: kMainColor(context),
              fontWeight: FontWeight.bold
            ),
          ) : const SizedBox(),

          labelText != null ? SizedBox(height: 10.h,) : const SizedBox(),

          Container(
            decoration: BoxDecoration(
              boxShadow: kScaffoldBgColor(context) == kNeutralDark ? [] : [
                BoxShadow(
                  color: kNeutralLightGrey,
                  blurRadius: 8.r,
                  spreadRadius: 4.r,
                  offset: const Offset(-0.5, 1.0)
                ),
              ]
            ),
            child: TextFormField(
              readOnly: readonly ?? false,
              initialValue: initialValue,
              minLines: 1,
              maxLines: maxLines ?? 1,
              style: kNormalTextStyle(context).copyWith(
                fontSize: fontSize ?? 15.sp, 
                color: textColor ?? kMainColor(context),
              ),
              cursorColor: cursorColor,
              obscureText: obscureText,
              keyboardType: textInputType ?? TextInputType.text,
              maxLength: maxLength ?? 1000,
              decoration: InputDecoration(
                contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
                hintText: hintText,
                filled: filled,
                fillColor: fillColor,
                hintStyle: kTextFieldTextStyle(context).copyWith(
                  color: kMainColor(context).withOpacity(0.5),
                ),
                prefixIcon: prefixIcon != null ? Padding(
                  padding: EdgeInsets.only(right: 16.r, left: 24.r),
                  child: Icon(
                    prefixIcon,
                    color: iconColor,
                    size: 24.r,
                  ),
                ) : const SizedBox(width: 0,),
                suffixIcon: GestureDetector(
                  onTap: suffixIconOTap ?? () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.r),
                    child: Icon(suffixIcon, color: kMainColor(context), size: 24.r,),
                  ),
                ),
                // labelText: labelText ?? hintText,
                // labelStyle: TextStyle(
                //   color: kFontTheme(context).withOpacity(0.5),
                //   fontWeight: FontWeight.normal,
                //   fontSize: 15.sp,
                // ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: errorBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                ),
                errorStyle: TextStyle(
                  color: errorTextStyleColor,
                  fontSize: 15.sp,
                ),
              ),
              // onSaved: onSaved,
              onChanged: onChanged,
              validator: validator ??  (value) {
                if (value!.isEmpty ) {
                  return 'This field cannot be empty';
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}