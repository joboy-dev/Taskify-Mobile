import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taskify/screens/bottom_sheet/create_category_sheet.dart';
import 'package:taskify/screens/bottom_sheet/send_notification_sheet.dart';
import 'package:taskify/screens/bottom_sheet/user/delete_account_sheet.dart';
import 'package:taskify/screens/bottom_sheet/user/logout_sheet.dart';
import 'package:taskify/screens/base_nav_screen.dart';
import 'package:taskify/screens/main/settings/categories/all_categories_screen.dart';
import 'package:taskify/screens/main/settings/teams/all_teams_screen.dart';
import 'package:taskify/screens/main/settings/edit_profile_screen.dart';
import 'package:taskify/services/provider/notifications_provider.dart';
import 'package:taskify/services/provider/theme_provider.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/utils/navigator.dart';
import 'package:taskify/shared/widgets/bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List workspace = ['hello'];

  @override
  Widget build(BuildContext context) {
    // Theme provider
    final themeProvider = context.read<ThemeProvider>();
    bool darkMode = context.watch<ThemeProvider>().isDarkMode;

    // Notifications provider
    final notificationsProvider = context.read<NotificationsProvider>();
    bool receiveNotifications = context.watch<NotificationsProvider>().receiveNotifications;

    return BaseNavScreen(
      title: 'Settings',
      icon: Icons.settings_outlined,
      content: SizedBox(
        height: 490.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: kNeutralDarkGrey,
                    ),
                  ),
                  SizedBox(width: 20.w),
          
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name Name',
                          style: kNormalTextStyle(context).copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                    
                        Text(
                          'josephkorede36@...',
                          style: kSecondaryNormalTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
          
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        navigatorPush(context, const EditProfileScreen());
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: kMainColor(context), width: 1.w),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit',
                                style: kNormalTextStyle(context),
                              ),
                              Icon(Icons.edit_outlined, color: kMainColor(context), size: 24.w,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ), // end details
              SizedBox(height: 20.h),
          
              // SettingsSection(
              //   sectionName: 'Workspace',
              //   child: InkWell(
              //     onTap: () {
                    
              //     },
              //     borderRadius: BorderRadius.circular(16.r),
              //     child: workspace.isEmpty ? Container(
              //       height: 80.h,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         color: kNeutralDarkGrey,
              //         borderRadius: BorderRadius.circular(16.sp)
              //       ),
              //       child: Center(
              //         child: Text(
              //           'Add a workspace  + ',
              //           style: kNormalTextStyle(context).copyWith(
              //             color: kNeutralDark,
              //             fontSize: 16.sp,
              //             fontWeight: FontWeight.bold
              //           ),
              //         ),
              //       ),
              //     ) : SettingsCard(
              //       leading: CircleAvatar(
              //         backgroundColor: kNeutralDarkGrey,
              //         radius: 24.r,
              //       ),
              //       main: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Workspace name',
              //             style: kNormalTextStyle(context).copyWith(
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           SizedBox(height: 5.h),
                    
              //           Text(
              //             'josephkorede36@agamil.com',
              //             style: kSecondaryNormalTextStyle(context).copyWith(
              //               fontSize: 12.sp
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ),
              // ),

              SettingsSection(
                sectionName: 'App Settings',
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        navigatorPush(context, const AllCategoriesScreen());
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: SettingsCard(
                        leading: CircleAvatar(
                          backgroundColor: kNeutralLightGrey,
                          radius: 24.r,
                          child: Icon(
                            Icons.category_outlined,
                            color: kNeutralDark,
                            size: 24.w,
                          ),
                        ),
                        main: Text(
                          'View all task categories',
                          style: kNormalTextStyle(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),

                    InkWell(
                      onTap: () {
                        showSheet(context, const CreateCategorySheet(), 'Create Category');
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: SettingsCard(
                        leading: CircleAvatar(
                          backgroundColor: kNeutralLightGrey,
                          radius: 24.r,
                          child: Icon(
                            Icons.dashboard_customize_outlined,
                            color: kNeutralDark,
                            size: 24.w,
                          ),
                        ),
                        main: Text(
                          'Create task category',
                          style: kNormalTextStyle(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),

                    InkWell(
                      onTap: () {
                        navigatorPush(context, const AllTeamsScreen());
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: SettingsCard(
                        leading: CircleAvatar(
                          backgroundColor: kNeutralLightGrey,
                          radius: 24.r,
                          child: Icon(
                            Icons.people_alt_outlined,
                            color: kNeutralDark,
                            size: 24.w,
                          ),
                        ),
                        main: Text(
                          'View all teams',
                          style: kNormalTextStyle(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),

                  ],
                ),
              ),
          
              SettingsSection(
                sectionName: 'Theme', 
                child: SettingsCard(
                  leading: CircleAvatar(
                    backgroundColor: kNeutralLightGrey,
                    radius: 24.r,
                    child: Icon(
                      kScaffoldBgColor(context) == kNeutralDark 
                        ? Icons.brightness_2
                        :Icons.wb_sunny_outlined,
                      color: kNeutralDark,
                      size: 24.w,
                    ),
                  ),
                  main: Expanded(
                    flex: 4,
                    child: Text(
                      kScaffoldBgColor(context) == kNeutralDark ? 'Switch to light mode' : 'Switch to dark mode',
                      style: kNormalTextStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: Expanded(
                    flex: 1,
                    child: Transform.scale(
                      scale: 1.r,
                      child: Switch.adaptive(
                        value: darkMode, 
                        activeTrackColor: kPrimaryColor,
                        inactiveTrackColor: kNeutralLightGrey,
                        onChanged: (value) {
                          setState(() {
                            darkMode = value;
                          });
                          themeProvider.toggleThemeMode();
                          logger(darkMode);
                        },
                      ),
                    ),
                  ),
                )
              ),
          
              SettingsSection(
                sectionName: 'Notifications', 
                child: Column(
                  children: [
                    SettingsCard(
                      leading: CircleAvatar(
                        backgroundColor: kNeutralLightGrey,
                        radius: 24.r,
                        child: Icon(
                          receiveNotifications 
                            ? Icons.notifications_active_outlined
                            :Icons.notifications_off_outlined,
                          color: kNeutralDark,
                          size: 24.w,
                        ),
                      ),
                      main: Expanded(
                        flex: 4,
                        child: Text(
                          receiveNotifications ? 'Notifications: On' : 'Notifications:: Off',
                          style: kNormalTextStyle(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: Expanded(
                        flex: 1,
                        child: Transform.scale(
                          scale: 1.r,
                          child: Switch.adaptive(
                            value: receiveNotifications, 
                            activeTrackColor: kPrimaryColor,
                            inactiveTrackColor: kNeutralLightGrey,
                            onChanged: (value) {
                              setState(() {
                                receiveNotifications = value;
                              });
                              notificationsProvider.toggleNotifications();
                              logger(receiveNotifications);
                            },
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        showSheet(context, const SendNotificationSheet(), 'Send Notification');
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: SettingsCard(
                        leading: CircleAvatar(
                          backgroundColor: kNeutralLightGrey,
                          radius: 24.r,
                          child: Icon(
                            Icons.send_outlined,
                            color: kNeutralDark,
                            size: 24.w,
                          ),
                        ),
                        main: Text(
                          'Send notification message',
                          style: kNormalTextStyle(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                  ],
                )
              ),
          
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showSheet(context, const LogoutSheet(), 'Log out');
                    }, 
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                    ),
                    child: Text(
                      'Log out',
                      style: kNormalTextStyle(context).copyWith(
                        color: kSemanticRed,
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  
                  TextButton(
                    onPressed: () {
                      showSheet(context, const DeleteAccountSheet(), 'Delete account');
                    }, 
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                    ),
                    child: Text(
                      'Delete account',
                      style: kNormalTextStyle(context).copyWith(
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key, required this.leading, required this.main, this.trailing,
  });

  final Widget leading;
  final Widget main;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            leading,
            SizedBox(width: 20.w),
    
            main,

            trailing ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.sectionName,
    required this.child,
  });

  final String sectionName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionName,
          style: kAppbarTextStyle(context).copyWith(
            fontSize: 16.sp
          ),
        ),
        SizedBox(height: 10.h),
        child,
        SizedBox(height: 20.h),
      ],
    );
  }
}