import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/calendar.dart';
import 'package:taskify/shared/widgets/date_text_widget.dart';
import 'package:taskify/shared/widgets/search.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class CreateProjectSheet extends StatefulWidget {
  const CreateProjectSheet({super.key});

  @override
  State<CreateProjectSheet> createState() => _CreateProjectSheetState();
}

class _CreateProjectSheetState extends State<CreateProjectSheet> {
  final _formKey = GlobalKey<FormState>();

  String projectName = '';
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
  bool showCalendarError = false;
  bool showMemberError = false;
  bool showLabelError = false;

  validateNonTextFields() {
    // Date validation
    if (selectedDates.isEmpty) {
      setState(() {
        showCalendarError = true;
      });
    } else {
      setState(() {
        showCalendarError = false;
      });
    }

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
      if (!showCalendarError && !showLabelError && !showMemberError) {
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
          NormalTextFieldNoPrefixIcon(
            hintText: 'Project name',
            labelText: 'Name',
            onChanged: (value) {
              setState(() {
                projectName = value!;
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
      
          FieldSection(
            text: 'Calendar',
            child: InkWell(
              onTap: () async {
                setState(() {
                  showCalendar = true;
                });
              },
              child: selectedDates.isEmpty 
              ? Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kScaffoldBgColor(context),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: showMemberError ? kSemanticRed : kPrimaryColor,
                    width: 1.w
                  )
                ),
                child: Center(
                  child: Text(
                    'Select date',
                    style: kNormalTextStyle(context).copyWith(
                      color: showMemberError ? kSemanticRed : kMainColor(context),
                    ),
                  ),
                ),
              ) 
              : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                selectedDates.length, 
                (index) {
                  final date = selectedDates[index];
                  return DateTextWidget(
                    iconBackgroundColor: index == 1 
                      ? kPrimaryColor
                      : kScaffoldBgColor(context) == kNeutralDark ? kNeutralDarkGrey : kNeutralDark,
                    dateText: DateFormat('MMM d, yyyy').format(date!),
                  );
                }
              ),
            ),
            ),
          ),
      
          // Open calandar
          showCalendar ? SizedBox(
            height: 450.h,
            child: CalendarWidget(
              selectedDates: selectedDates,
              onConfirm: (dates) {
                setState(() {
                  selectedDates = dates;
                  showCalendar = false;
                  showCalendarError = false;
                  logger('Dates: $selectedDates');
                });
              },
            ),
          ) : const SizedBox(),
      
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
      
          NormalTextFieldNoPrefixIcon(
            hintText: 'Enter description',
            labelText: 'Description',
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