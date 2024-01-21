// ignore_for_file: must_be_immutable

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/animations.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/date_text_widget.dart';
import 'package:taskify/shared/widgets/snackbar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final now = DateTime.now();
  final selectedDate = DateTime.now();

  List<DateTime?> _selectedDates = [];
  List<String>? weekdayLabels = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

  Color dateIconBackgroundColor(int index) {
    if (_selectedDates.length == 1) {
      return kPrimaryColor;
    } else {
      if (index == 0) {
        return kScaffoldBgColor(context) == kNeutralDark ? kNeutralDarkGrey : kNeutralDark;
      } else {
        return kPrimaryColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Calendar',
      titleFontSize: 16.sp,
      screen: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300.h,
            decoration: BoxDecoration(
              color: kNeutralLight,
              boxShadow: [
                BoxShadow(
                  color: kNeutralLightGrey,
                  blurRadius: 4.r,
                  spreadRadius: 2.r,
                  offset: const Offset(-0.5, 1.0)
                ),
              ],
              borderRadius: BorderRadius.circular(16.r)
            ),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
                currentDate: now,
                firstDate: now,
                lastDate: DateTime(2100),
                dayTextStyle: kNormalTextStyle(context).copyWith(
                  color: kNeutralDark,
                  fontSize: 12.sp
                ),
                yearTextStyle: kNormalTextStyle(context).copyWith(
                  color: kNeutralDark,
                  fontSize: 12.sp
                ),
                todayTextStyle: kNormalTextStyle(context).copyWith(
                  color: kNeutralDark,
                  fontSize: 12.sp
                ),
                selectedRangeHighlightColor: kNeutralLightGrey,
                selectedDayHighlightColor: kPrimaryColor,
                weekdayLabelTextStyle: kNormalTextStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: kNeutralDark,
                  fontSize: 12.sp
                ),
                selectedRangeDayTextStyle: kNormalTextStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: kNeutralDarkGrey,
                ),
                selectedDayTextStyle: kNormalTextStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: kNeutralLight,
                ),
                weekdayLabels: weekdayLabels,
                firstDayOfWeek: 1,
                centerAlignModePicker: true,
              ),
              value: _selectedDates,
              onValueChanged: (value) {
                setState(() {
                  _selectedDates = value;
                });
                logger(_selectedDates);
              },
            ),
          ).animate()
          .scale(duration: kDurationMs(300), begin: const Offset(0.7, 0.7)),
          SizedBox(height: 20.h),

          _selectedDates.isEmpty 
          ? const SizedBox()
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _selectedDates.length, 
              (index) {
                final date = _selectedDates[index];
                return DateTextWidget(
                  iconBackgroundColor: dateIconBackgroundColor(index),
                  dateText: DateFormat('MMM d, yyyy').format(date!),
                ).animate(effects: MyEffects.fadeSlide());
              }
            ),
          ),
          SizedBox(height: 30.h),

          _selectedDates.length != 2 ? const SizedBox() : Button(
            buttonText: 'Continue', 
            onPressed: () {
              if (_selectedDates[0] == _selectedDates[1]) {
                showSnackbar(context, 'Start and end dates cannot be the same');
              } else {
                navigatorPop(context, result: _selectedDates);
              }
            }, 
            buttonColor: kPrimaryColor, 
            inactive: false,
            width: double.infinity,
            textColor: kNeutralLight,
          )
        ],
      ),
    );
  }
}


class CalendarWidget extends StatefulWidget {
  CalendarWidget({super.key, required this.selectedDates, required this.onConfirm});

  List<DateTime?> selectedDates;
  final Function(List<DateTime?> selectedDates) onConfirm;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final now = DateTime.now();
  List<String>? weekdayLabels = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

  bool showErrorText = false;

  Color dateIconBackgroundColor(int index) {
    if (widget.selectedDates.length == 1) {
      return kPrimaryColor;
    } else {
      if (index == 0) {
        return kScaffoldBgColor(context) == kNeutralDark ? kNeutralDarkGrey : kNeutralDark;
      } else {
        return kPrimaryColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250.h,
          decoration: BoxDecoration(
            color: kNeutralLight,
            boxShadow: [
              BoxShadow(
                color: kNeutralLightGrey,
                blurRadius: 4.r,
                spreadRadius: 2.r,
                offset: const Offset(-0.5, 1.0)
              ),
            ],
            borderRadius: BorderRadius.circular(16.r)
          ),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              currentDate: now,
              firstDate: now,
              lastDate: DateTime(2100),
              dayTextStyle: kNormalTextStyle(context).copyWith(
                color: kNeutralDark,
                fontSize: 12.sp
              ),
              yearTextStyle: kNormalTextStyle(context).copyWith(
                color: kNeutralDark,
                fontSize: 12.sp
              ),
              todayTextStyle: kNormalTextStyle(context).copyWith(
                color: kNeutralDark,
                fontSize: 12.sp
              ),
              selectedRangeHighlightColor: kNeutralLightGrey,
              selectedDayHighlightColor: kPrimaryColor,
              weekdayLabelTextStyle: kNormalTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
                color: kNeutralDark,
                fontSize: 12.sp
              ),
              selectedRangeDayTextStyle: kNormalTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
                color: kNeutralDarkGrey,
              ),
              selectedDayTextStyle: kNormalTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
                color: kNeutralLight,
              ),
              weekdayLabels: weekdayLabels,
              firstDayOfWeek: 1,
              centerAlignModePicker: true,
            ),
            value: widget.selectedDates,
            onValueChanged: (value) {
              setState(() {
                widget.selectedDates = value;
              });
              // logger(widget.selectedDates);
            },
          ),
        ).animate(effects: MyEffects.fadeSlide()),
        SizedBox(height: 20.h),

        widget.selectedDates.isEmpty 
        ? const SizedBox()
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            widget.selectedDates.length, 
            (index) {
              final date = widget.selectedDates[index];
              return DateTextWidget(
                iconBackgroundColor: dateIconBackgroundColor(index),
                dateText: DateFormat('MMM d, yyyy').format(date!),
              ).animate(effects: MyEffects.fadeSlide());
            }
          ),
        ),
        SizedBox(height: 5.h),

        showErrorText ? Text(
          'Start and end dates cannot be the same',
          style: kNormalTextStyle(context).copyWith(
            color: kSemanticRed,
          ),
        ) : const SizedBox(),

        SizedBox(height: 15.h),

        widget.selectedDates.length != 2 ? const SizedBox() : Button(
          buttonText: 'Confirm', 
          onPressed: () {
            if (widget.selectedDates[0] == widget.selectedDates[1]) {
              setState(() {
                showErrorText = true;
              });
            } else {
              widget.onConfirm(widget.selectedDates);
            }
          }, 
          buttonColor: kPrimaryColor, 
          inactive: false,
          width: double.infinity,
          textColor: kNeutralLight,
        )
      ],
    );
  }
}

