import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:taskify/screens/base_nav_screen.dart';
import 'package:taskify/services/provider/notifications_provider.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/cards.dart';

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
                  child: BaseCard(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: kNeutralDarkGrey,
                            radius: 24.r,
                          ),
                        ),
                        SizedBox(width: 20.w),
                                      
                        Expanded(
                          flex: 5,
                          child: Column(
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
                                'Message for you. You need to read this message. Slide to see actions you can perform with this message.',
                                style: kSecondaryNormalTextStyle(context).copyWith(
                                  fontSize: 12.sp
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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