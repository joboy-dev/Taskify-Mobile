import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class CreateCategorySheet extends StatefulWidget {
  const CreateCategorySheet({super.key});

  @override
  State<CreateCategorySheet> createState() => _CreateCategorySheetState();
}

class _CreateCategorySheetState extends State<CreateCategorySheet> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool showLabelError = false;

  String categoryName = '';
  String description = '';
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

  validateNonTextFields() {
    // Label validation
    if (selectedLabelColor == null) {
      setState(() {
        showLabelError = true;
      });

      return false;
    } else {
      setState(() {
        showLabelError = false;
      });

      return true;
    }
  }

  processForm() {
    if (_formKey.currentState!.validate() && validateNonTextFields()) {
      navigatorPop(context);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalTextFieldNoPrefixIcon(
            hintText: 'Category name',
            labelText: 'Name',
            onChanged: (value) {
              setState(() {
                categoryName = value!;
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

          NormalTextFieldNoPrefixIcon(
            labelText: 'Description',
            hintText: 'Enter description',
            onChanged: (value) {
              setState(() {
                description = value!;
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
            maxLines: 5,
          ),
          SizedBox(height: 10.h),

          FieldSection(
            text: 'Select label', 
            child: SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ListView.builder(
                itemCount: labelColors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final color = labelColors[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.r),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedLabelColor = color.toString().substring(6, 16);
                          showLabelError = false;
                          logger(selectedLabelColor!);
                        });
                      },
                      child: Container(
                        height: 44.h,
                        width: 44.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedLabelColor == null 
                              ? Colors.transparent
                              : Color(int.parse(selectedLabelColor!)) == color ? kNeutralDarkGrey : Colors.transparent,
                            width: 3.w,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          color: color,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Error text
          showLabelError ? Text(
            'Select a label',
            style: kNormalTextStyle(context).copyWith(
              color: kSemanticRed,
            ),
          ) : const SizedBox(),
          SizedBox(height: 10.h),
      
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