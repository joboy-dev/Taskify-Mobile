// ignore_for_file: constant_identifier_names

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

// Priority enum
enum Priority {Low, Medium, High}

// Based on backend values for priority
Map priorityValues = {
  Priority.Low: 'low',
  Priority.Medium: 'medium',
  Priority.High: 'high'
};

// Map priorityValues = {
//   'Low': 'L',
//   'Medium': 'M',
//   'High': 'H'
// };

class CreateTaskSheet extends StatefulWidget {
  const CreateTaskSheet({super.key});

  @override
  State<CreateTaskSheet> createState() => _CreateTaskSheetState();
}

class _CreateTaskSheetState extends State<CreateTaskSheet> {
  final _formKey = GlobalKey<FormState>();

  String projectName = '';
  String description = '';

  List<DateTime?> selectedDates = [];
  bool showCalendar = false;

  bool showSearchWidget = false;

  List selectedMembers = [];

  String? selectedPriority;
  String? selectedCategory;
  String? selectedProject;

  // Error texts
  bool showCalendarError = false;
  bool showMemberError = false;

  bool isTeamTask = false;

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
      if (!showCalendarError && !showMemberError) {
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Project: ',
          //       style: kNormalTextStyle(context),
          //     )
              
          //   ],
          // ),
          // SizedBox(height: 20.h),

          NormalTextFieldNoPrefixIcon(
            hintText: 'Task name',
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
                      color: showMemberError ? kSemanticRed : kSecondaryColor,
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

          // Project
          DropDownFormField(
            value: selectedPriority, 
            items: Priority.values.map(
              (priority) => DropdownMenuItem(
                value: priorityValues[priority],
                child: Text(
                  priority.name,
                  style: kNormalTextStyle(context),
                ),
              )
            ).toList(), 
            onChanged: (value) {
              setState(() {
                selectedPriority = value;
              });

              logger(selectedPriority!);
            },
            labelText: 'Select project',
            prefixIcon: Icons.dashboard_outlined, 
            enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            errorBorderColor: kSemanticRed, 
            focusedErrorBorderColor: kSemanticRed, 
            errorTextStyleColor: kSemanticRed, 
            iconColor: kMainColor(context), 
            filled: true,
            fillColor: kScaffoldBgColor(context),
          ),
      
          // Priority
          DropDownFormField(
            value: selectedPriority, 
            items: Priority.values.map(
              (priority) => DropdownMenuItem(
                value: priorityValues[priority],
                child: Text(
                  priority.name,
                  style: kNormalTextStyle(context),
                ),
              )
            ).toList(), 
            onChanged: (value) {
              setState(() {
                selectedPriority = value;
              });

              logger(selectedPriority!);
            },
            labelText: 'Select priority',
            prefixIcon: Icons.priority_high_outlined, 
            enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            errorBorderColor: kSemanticRed, 
            focusedErrorBorderColor: kSemanticRed, 
            errorTextStyleColor: kSemanticRed, 
            iconColor: kMainColor(context), 
            filled: true,
            fillColor: kScaffoldBgColor(context),
          ),

          // Category
          DropDownFormField(
            value: selectedPriority, 
            items: Priority.values.map(
              (priority) => DropdownMenuItem(
                value: priorityValues[priority],
                child: Text(
                  priority.name,
                  style: kNormalTextStyle(context),
                ),
              )
            ).toList(), 
            onChanged: (value) {
              setState(() {
                selectedPriority = value;
              });

              logger(selectedPriority!);
            },
            labelText: 'Select category',
            prefixIcon: Icons.category_outlined, 
            enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            errorBorderColor: kSemanticRed, 
            focusedErrorBorderColor: kSemanticRed, 
            errorTextStyleColor: kSemanticRed, 
            iconColor: kMainColor(context), 
            filled: true,
            fillColor: kScaffoldBgColor(context),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Team task',
                style: kNormalTextStyle(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
                ),
              ),

              Transform.scale(
                scale: 1.w,
                child: Switch.adaptive(
                  value: isTeamTask, 
                  activeTrackColor: kPrimaryColor,
                  inactiveTrackColor: kNeutralLightGrey,
                  onChanged: (value) {
                    setState(() {
                      isTeamTask = value;
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),

          // Team
          !isTeamTask ? const SizedBox() : DropDownFormField(
            value: selectedPriority, 
            items: Priority.values.map(
              (priority) => DropdownMenuItem(
                value: priorityValues[priority],
                child: Text(
                  priority.name,
                  style: kNormalTextStyle(context),
                ),
              )
            ).toList(), 
            onChanged: (value) {
              setState(() {
                selectedPriority = value;
              });

              logger(selectedPriority!);
            },
            labelText: 'Select team',
            prefixIcon: Icons.people_alt_outlined, 
            enabledBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            focusedBorderColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : Colors.transparent, 
            errorBorderColor: kSemanticRed, 
            focusedErrorBorderColor: kSemanticRed, 
            errorTextStyleColor: kSemanticRed, 
            iconColor: kMainColor(context), 
            filled: true,
            fillColor: kScaffoldBgColor(context),
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

          SizedBox(height: 150.h),
        ],
      ),
    );
  }
}