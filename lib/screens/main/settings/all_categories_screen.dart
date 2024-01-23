import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';
import 'package:taskify/shared/widgets/cards.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Categories',
      titleFontSize: 16.sp,
      screen: SizedBox(
        height: 570.h,
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
                    icon: Icons.edit,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        backgroundColor: kNeutralLightGrey,
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
                            'Category Name',
                            style: kNormalTextStyle(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'Just a description for each category.',
                            style: kSecondaryNormalTextStyle(context),
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
      ),
    );
  }
}