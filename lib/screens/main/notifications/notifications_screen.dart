import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:taskify/screens/main/base_nav_screen.dart';
import 'package:taskify/services/provider/notifications_provider.dart';
import 'package:taskify/shared/constants.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    bool receiveNotifications = context.read<NotificationsProvider>().receiveNotifications;

    return BaseNavScreen(
      title: 'Notifications',
      icon: Icons.notifications_outlined,
      content: !receiveNotifications 
        ? SizedBox(
          height: 450.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications_off_rounded, size: 48.w, color: kNeutralDarkGrey),
                SizedBox(height: 20.h),
                Text(
                  'Enable notifications in settings',
                  style: kNormalTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ): Column(
        children: [
          SizedBox(
            height: 490.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          
                        },
                        backgroundColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : kNeutralDark,
                        foregroundColor: kPrimaryColor,
                        icon: Icons.check_circle_outline,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      SizedBox(width: 10.w),
                      SlidableAction(
                        onPressed: (context) {
                          
                        },
                        backgroundColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : kNeutralDark,
                        foregroundColor: kSemanticRed,
                        icon: Icons.delete_outline,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ],
                  ),
                  child: Card(
                    color: kScaffoldBgColor(context),
                    surfaceTintColor: Colors.transparent,
                    elevation: kScaffoldBgColor(context) == kNeutralDark ? 0.0 : 2.r,
                    shadowColor: kNeutralLightGrey,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: kNeutralLight,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: kNeutralDarkGrey,
                            radius: 24.r,
                          ),
                          SizedBox(width: 20.w),
                  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name name',
                                style: kNormalTextStyle(context).copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.h),
                          
                              Text(
                                'Messagee for you.',
                                style: kSecondaryNormalTextStyle(context).copyWith(
                                  fontSize: 12.sp
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}