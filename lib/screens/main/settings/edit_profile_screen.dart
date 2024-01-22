import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskify/screens/auth/reset_password_screen.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showImageError= false;

  // Image
  String? mediaPath;
  XFile? pickedMedia;

  String name = '';
  String email = '';
  String phoneNumber = '';

  /// Function to pick an image
  pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
                                              
    setState(() {
      pickedMedia = null;
    });

    // pick image from file system
    pickedMedia = await imagePicker.pickImage(source: source);

    if (pickedMedia != null) {
      setState(() {
        mediaPath = pickedMedia!.path;
        showImageError = false;
      });
      logger('Selected Image Path: $mediaPath');
      logger('Picked Media: $pickedMedia');
    }
  }

  validateNonTextFields() {
    // Media validation
    if (mediaPath == null) {
      setState(() {
        showImageError = true;
      });
    } else {
      setState(() {
        showImageError = false;
      });
    }
  }

  processForm() {
    if (_formKey.currentState!.validate()) {
      if (!showImageError) {
        navigatorPop(context);
      }
    } else {
      validateNonTextFields();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Edit Profile',
      titleFontSize: 16.sp,
      screen: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      pickImage(ImageSource.gallery);
                    },
                    borderRadius: BorderRadius.circular(40.r),
                    child: CircleAvatar(
                      backgroundColor: kNeutralDarkGrey,
                      radius: 40.r,
                      backgroundImage: mediaPath == null ? null : FileImage(File(mediaPath!)),
                      child: mediaPath==null ? Icon(Icons.camera_alt_rounded, size: 24.w, color: kNeutralLightGrey,) : null,
                    ),
                  ),
                  SizedBox(height: 10.h),
        
                  Text(
                    showImageError ? 'Select an image' : 'Tap to upload image',
                    style: kNormalTextStyle(context).copyWith(
                      color: showImageError ? kSemanticRed: kSecondaryColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
        
            NormalTextField(
              hintText: 'Name',
              labelText: 'Name',
              onChanged: (value) {
                setState(() {
                  name = value!;
                });
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
              labelText: 'Email',
              onChanged: (value) {
                setState(() {
                  email = value!;
                });
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
        
        
            NormalTextField(
              hintText: 'Phone number',
              labelText: 'Phone number',
              onChanged: (value) {
                setState(() {
                  phoneNumber = value!;
                });
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
              textInputType: TextInputType.number,
            ),
        
            Text(
              'Password',
              style: kNormalTextStyle(context).copyWith(
                fontSize: 16.sp,
                color: kMainColor(context),
                fontWeight: FontWeight.bold
              ),
            ),
        
            TextButton(
              onPressed: () {
                navigatorPush(context, ResetPasswordScreen(userEmail: email, showOldPasswordField: true,));
              }, 
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              child: Text(
                'Change Password',
                style: kNormalTextStyle(context).copyWith(
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 30.h),
        
            Button(
              buttonText: 'Save Changes',
              buttonColor: kPrimaryColor,
              inactive: false,
              width: double.infinity,
              textColor: kNeutralLight,
              onPressed: processForm,
            ),

            SizedBox(height: 10.h),

          ],
        ),
      ), 
    );
  }
}