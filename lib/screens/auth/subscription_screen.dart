import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/screens/auth/signup/verify_email_address_screen.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/cards.dart';
import 'package:taskify/shared/widgets/snackbar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key, required this.email, required this.password, required this.firstName, required this.lastName, required this.phone});

  final String email, password, firstName, lastName, phone;

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List<String> plans = ['Basic', 'Premium', 'Enterprise'];
  String? selectedPlan;

  // IconData planIcon() {
  //   if (selectedPlan == 'basic') {
  //     return Icons.
  //   }
  // }

  processForm() {
    if (selectedPlan != null) {
      navigatorPush(context, const VerifyEmailAddressScreen());
    } else {
      showSnackbar(context, 'Select a plan before proceeding');
    }
  }

  @override
  Widget build(BuildContext context) {
    logger(widget.email);
    logger(widget.password);

    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Choose plan',
      titleFontSize: 16.sp,
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 500.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose plan',
                  style: kNormalTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Unlock more features with premium and enterprise',
                  style: kSecondaryNormalTextStyle(context).copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),

                SizedBox(
                  height: 320.h,
                  child: GridView.builder(
                    itemCount: plans.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                    itemBuilder: (context, index) {
                      final plan = plans[index];

                      return BaseCard(
                        onTap: () {
                          setState(() {
                            selectedPlan = plan.toLowerCase();
                          });
                          logger(selectedPlan!);
                        },
                        color: selectedPlan?.toLowerCase() == plan.toLowerCase() ? kPrimaryColor : kScaffoldBgColor(context),
                        borderColor: selectedPlan?.toLowerCase() == plan.toLowerCase() ? Colors.transparent : kNeutralLight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              plan,
                              style: kNormalTextStyle(context).copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: selectedPlan?.toLowerCase() == plan.toLowerCase() ? kNeutralLight : kMainColor(context)
                              ),
                            )
                          ],
                        ),
                      );
                      
                    },
                  ),
                )

              ],
            ),
          ),

          Button(
            width: double.infinity,
            buttonText: 'Continue', 
            onPressed: processForm, 
            buttonColor: kPrimaryColor, 
            textColor: kNeutralLight,
            inactive: false,
          )
        ],
      ),
    );
  }
}