import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class SendNotificationSheet extends StatefulWidget {
  const SendNotificationSheet({super.key});

  @override
  State<SendNotificationSheet> createState() => _SendNotificationSheetState();
}

class _SendNotificationSheetState extends State<SendNotificationSheet> {
  final _formKey = GlobalKey<FormState>();

  String message = '';

  List<String> recipients = ['1', '2', '3'];
  String? selectedRecepient;

  processForm() {
    if (_formKey.currentState!.validate()) {
      navigatorPop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Team
          DropDownFormField(
            value: selectedRecepient, 
            items: recipients.map(
              (recipient) => DropdownMenuItem(
                value: recipient,
                child: Text(
                  recipient,
                  style: kNormalTextStyle(context),
                ),
              )
            ).toList(), 
            onChanged: (value) {
              setState(() {
                selectedRecepient = value;
              });

              logger(selectedRecepient!);
            },
            labelText: 'To',
            prefixIcon: Icons.person_2_outlined, 
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
            labelText: 'Message',
            hintText: 'Enter message',
            onChanged: (value) {
              setState(() {
                message = value!;
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

      
        ],
      ),
    );
  }
}

// Padding(
//                   padding: EdgeInsets.all(8.r),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: kNeutralLightGrey,
//                         radius: 24.r,
//                       ),
//                       SizedBox(width: 20.w),
                  
//                       Text(
//                         recipient,
//                         style: kNormalTextStyle(context),
//                       ),
//                     ],
//                   ),
//                 ),