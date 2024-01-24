import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class ViewOtherUsersProfileSheet extends StatefulWidget {
  const ViewOtherUsersProfileSheet({super.key, this.otherData});

  final Widget? otherData;

  @override
  State<ViewOtherUsersProfileSheet> createState() => _ViewOtherUsersProfileSheetState();
}

class _ViewOtherUsersProfileSheetState extends State<ViewOtherUsersProfileSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: kNeutralDarkGrey,
            radius: 40.r,
          ),
        ),
        SizedBox(height: 30.h),
    
        NormalTextField(
          readonly: true,
          hintText: 'First name',
          labelText: 'First name',
          onChanged: (value) {
            
          }, 
          enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          errorBorderColor: kSemanticRed, 
          focusedErrorBorderColor: kSemanticRed, 
          errorTextStyleColor: kSemanticRed, 
          prefixIcon: Icons.person_2_outlined,
          iconColor: kMainColor(context), 
          cursorColor: kMainColor(context),
          filled: true,
          fillColor: kScaffoldBgColor(context),
        ),

        NormalTextField(
          readonly: true,
          hintText: 'Last name',
          labelText: 'Last name',
          onChanged: (value) {
            
          }, 
          enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          errorBorderColor: kSemanticRed, 
          focusedErrorBorderColor: kSemanticRed, 
          errorTextStyleColor: kSemanticRed, 
          prefixIcon: Icons.person_2_outlined,
          iconColor: kMainColor(context), 
          cursorColor: kMainColor(context),
          filled: true,
          fillColor: kScaffoldBgColor(context),
        ),
    
        EmailTextField(
          readOnly: true,
          labelText: 'Email',
          onChanged: (value) {
            
          }, 
          enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          errorBorderColor: kSemanticRed, 
          focusedErrorBorderColor: kSemanticRed, 
          errorTextStyleColor: kSemanticRed, 
          iconColor: kMainColor(context), 
          cursorColor: kMainColor(context),
          filled: true,
          fillColor: kScaffoldBgColor(context),
        ),
    
    
        NormalTextFieldWithLength(
          readonly: true,
          hintText: 'Phone number',
          labelText: 'Phone number',
          onChanged: (value) {
            
          }, 
          enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
          errorBorderColor: kSemanticRed, 
          focusedErrorBorderColor: kSemanticRed, 
          errorTextStyleColor: kSemanticRed, 
          prefixIcon: Icons.phone,
          iconColor: kMainColor(context), 
          cursorColor: kMainColor(context),
          filled: true,
          fillColor: kScaffoldBgColor(context),
          textInputType: TextInputType.phone,
          maxLength: 11,
          validator: (value) {
            if (value!.length < 11) {
              return 'Phone number shoule be 11 numbers';
            } else {
              return null;
            }
          },
        ),

        widget.otherData ?? const SizedBox(),
 
      ],
    );
  }
}