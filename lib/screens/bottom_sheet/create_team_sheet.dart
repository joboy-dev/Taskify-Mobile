import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/search.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class CreateTeamSheet extends StatefulWidget {
  const CreateTeamSheet({super.key});

  @override
  State<CreateTeamSheet> createState() => _CreateTeamSheetState();
}

class _CreateTeamSheetState extends State<CreateTeamSheet> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String teamName = '';
  String description = '';

  List<DateTime?> selectedDates = [];
  bool showCalendar = false;

  bool showSearchWidget = false;

  List<Color> labelColors = [
    kOverlayGreen,
    kOverlayLightOrange,
    kOverlayLightPink,
    kOverlayOrange,
    kOverlayPink,
    kOverlayPurple,
    kOverlayYellow
  ];
  String? selectedLabelColor;

  List selectedMembers = [];

  // Error texts
  bool showImageError = false;
  bool showMemberError = false;
  bool showLabelError = false;

  // Image
  String? mediaPath;
  XFile? pickedMedia;

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
    // Label validation
    if (selectedLabelColor == null) {
      setState(() {
        showLabelError = true;
      });
    } else {
      setState(() {
        showLabelError = false;
      });
    }

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

    // Members validation
    if (selectedMembers.isEmpty) {
      setState(() {
        showMemberError = true;
      });
    } else {
      setState(() {
        showMemberError = false;
      });
    }
  }

  processForm() {
    if (_formKey.currentState!.validate()) {
      if (!showImageError && !showLabelError && !showMemberError) {
        navigatorPop(context);
      }
    } else {
      validateNonTextFields();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  child: CircleAvatar(
                    backgroundColor: kNeutralDarkGrey,
                    radius: 40.r,
                    backgroundImage: mediaPath == null ? null : FileImage(File(mediaPath!)),
                    child: mediaPath==null ? Icon(Icons.camera_alt_rounded, size: 24.w, color: kNeutralLightGrey,) : null,
                  ),
                ),
                SizedBox(height: 10.h),

                Text(
                  showImageError ? 'Select a team label image' : 'Tap the label to upload image',
                  style: kNormalTextStyle(context).copyWith(
                    color: showImageError ? kSemanticRed: kPrimaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          NormalTextFieldNoPrefixIcon(
            hintText: 'Team name',
            labelText: 'Name',
            onChanged: (value) {
              setState(() {
                teamName = value!;
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
            textInputType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 10.h),
      
          FieldSection(
            text: 'Add member',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 210.h,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.r),
                        child: CircleAvatar(
                          backgroundColor: kNeutralLightGrey,
                          backgroundImage: const AssetImage('assets/images/feature1.png'),
                          radius: 24.r,
                        ),
                      );
                    },
                  ),
                ),
            
                IconButton(
                  onPressed: () {
                    setState(() {
                      showSearchWidget = !showSearchWidget;
                    });
                    
                  }, 
                  icon: Icon(
                    showSearchWidget ? Icons.check : Icons.add, 
                    size: 24.w, 
                    color: showSearchWidget ? kSemanticGreen : kPrimaryColor,
                  ),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        width: 1.w,
                        color: showSearchWidget ? kSemanticGreen : kPrimaryColor,
                        style: BorderStyle.solid
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r)
                  ),
                ),
              ],
            ),
          ),

          // Error text
          showMemberError ? Text(
            'Add members to the project',
            style: kNormalTextStyle(context).copyWith(
              color: kSemanticRed,
            ),
          ) : const SizedBox(),
          SizedBox(height: 10.h),
      
          // Search for members
          showSearchWidget ? SizedBox(
            height: 250.h,
            child: const SearchWidget(), // implement just like calendar widget
          ) : const SizedBox(),
      
          Button(
            buttonText: 'Create', 
            onPressed: processForm, 
            buttonColor: kPrimaryColor, 
            inactive: false,
            width: double.infinity,
            textColor: kNeutralLight,
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}