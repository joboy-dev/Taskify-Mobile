import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/models/menu_item.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/date_text_widget.dart';
import 'package:taskify/shared/widgets/search.dart';
import 'package:taskify/shared/widgets/snackbar.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key, required this.taskId});

  final int taskId;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool showSearchWidget = false;
  String comment = '';

  sendComment() {
    if (comment.isEmpty) {
      showSnackbar(context, 'Enter comment.');
    } else {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = [
      MenuItem(
        text: 'Check done', 
        textColor: kMainColor(context),
        icon: Icons.task_alt_rounded, 
        onTap: () {

        },
      ),

      MenuItem(
        text: 'Delete task',
        textColor: kSemanticRed, 
        icon: Icons.delete_outline_rounded, 
        onTap: () {
          
        },
      ),
    ];


    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Task Detail',
      titleFontSize: 16.sp,
      padding: const EdgeInsets.all(0),
      trailing: Row(
        children: [
          MenuButton(
            items: items, 
            icon: Icons.menu,
            containerColor: Colors.transparent,
            iconColor: kScaffoldBgColor(context) == kNeutralDark ? kNeutralLight : kNeutralDark,
          ),
        ],
      ),
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kAppPadding(),
            child: SizedBox(
              height: 510.h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Project Name',
                          style: kSecondaryNormalTextStyle(context),
                        ),
                        SizedBox(width: 10.w),
                        Icon(Icons.dashboard_customize_outlined, size: 16.w, color: kMainColor(context),)
                      ],
                    ),
                    SizedBox(height: 10.h),
                
                    Text(
                      'Task name',
                      style: kAppbarTextStyle(context),
                    ),
                    SizedBox(height: 20.h),
                
                    SectionWidget(
                      sectionTitle: 'Assign (2)',
                      icon: Icons.person_add_alt_1_outlined,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 210.h,
                                child: ListView.builder(
                                  itemCount: 2,
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
                          SizedBox(height: 10.h),
                
                          // Search for members
                          showSearchWidget ? SizedBox(
                            height: 250.h,
                            child: const SearchWidget(), // implement just like calendar widget
                          ) : const SizedBox(),
                        ],
                      ),
                    ),
                
                    SectionWidget(
                      sectionTitle: 'Due date', 
                      icon: Icons.calendar_today_outlined, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2, 
                          (index) {
                            return DateTextWidget(
                              iconBackgroundColor: index == 1 
                                ? kPrimaryColor
                                : kScaffoldBgColor(context) == kNeutralDark ? kNeutralDarkGrey : kNeutralDark,
                              dateText: index == 0 ? 'Start date' : 'End date',
                            );
                          }
                        ),
                      ),
                    ),
                
                    SectionWidget(
                      sectionTitle: 'Description', 
                      icon: Icons.description_outlined, 
                      child: Text(
                        'A descriptive essay gives a vivid, detailed description of something—generally a place or object.',
                        style: kSecondaryNormalTextStyle(context),
                      )
                    ),
                
                    SectionWidget(
                      sectionTitle: 'Comments (5)', 
                      icon: Icons.message_outlined, 
                      child: SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.r),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      backgroundColor: kNeutralDarkGrey,
                                      radius: 30.r,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name Name',
                                          style: kNormalTextStyle(context).copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: kMainColor(context)
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          'They are commonly assigned as writing exercises at high school and in composition classes.',
                                          style: kSecondaryNormalTextStyle(context).copyWith(
                                            fontSize: 12.sp
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      onPressed: () {
                                      }, 
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      child: Text(
                                        'Reply',
                                        style: kNormalTextStyle(context).copyWith(
                                          color: kPrimaryColor,
                                          fontSize: 12.sp
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Comment Text Field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 2.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: NormalTextFieldNoPrefixIcon(
                    hintText: 'Post your comment',
                    onChanged: (value) {
                      setState(() {
                        comment = value!;
                      });
                    }, 
                    enabledBorderColor: kScaffoldBgColor(context), 
                    focusedBorderColor: kScaffoldBgColor(context), 
                    errorBorderColor: kSemanticRed, 
                    focusedErrorBorderColor: kSemanticRed, 
                    errorTextStyleColor: kSemanticRed, 
                    iconColor: kMainColor(context), 
                    cursorColor: kMainColor(context),
                    filled: true,
                    fillColor: kScaffoldBgColor(context),
                    maxLines: 3,
                    showShadow: false,
                  ),
                ),
                SizedBox(width: 10.w),
          
                Expanded(
                  flex: 0,
                  child: IconButton(
                    onPressed: sendComment, 
                    icon: Icon(Icons.send_outlined, size: 24.w, color: kMainColor(context),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key, required this.sectionTitle, required this.icon, required this.child,
  });

  final String sectionTitle;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconWithText(
          icon: icon,
          text: sectionTitle,
          mainColor: kMainColor(context),
          isBold: true,
          fontSize: 14.sp,
          iconSize: 20.w,
        ),
        SizedBox(height: 15.h),

        child,
        SizedBox(height: 20.h),
    
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key, 
    required this.icon, 
    required this.text, 
    required this.mainColor, 
    this.fontSize=11.0,
    this.iconSize=16.0,
    this.isBold = false,
  });

  final IconData icon;
  final String text;
  final Color mainColor;
  final double? fontSize;
  final double? iconSize;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize!.w, color: kMainColor(context)),
        SizedBox(width: 5.w),
        Text(
          text,
          style: kNormalTextStyle(context).copyWith(
            fontSize: fontSize!.sp,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
          ),
        )
      ],
    );
  }
}