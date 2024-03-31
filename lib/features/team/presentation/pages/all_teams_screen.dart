import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskify/core/constants/constants.dart';
import 'package:taskify/core/helpers/navigator.dart';
import 'package:taskify/features/general/presentation/pages/base_screen.dart';
import 'package:taskify/features/general/presentation/widgets/cards.dart';
import 'package:taskify/features/team/presentation/pages/team_detail_screen.dart';

class AllTeamsScreen extends StatefulWidget {
  const AllTeamsScreen({super.key});

  @override
  State<AllTeamsScreen> createState() => _AllTeamsScreenState();
}

class _AllTeamsScreenState extends State<AllTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: true,
      showBackButton: true,
      title: 'Teams',
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
                onTap: () {
                  navigatorPush(context, TeamDetailScreen(teamId: index));
                },
                
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
                            'Team Name',
                            style: kNormalTextStyle(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                'Number of members: ',
                                style: kSecondaryNormalTextStyle(context),
                              ),
                              Text(
                                '3',
                                style: kSecondaryNormalTextStyle(context).copyWith(
                                  color: kSecondaryColor
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                'Project: ',
                                style: kSecondaryNormalTextStyle(context),
                              ),
                              Text(
                                'Project name',
                                style: kSecondaryNormalTextStyle(context).copyWith(
                                  color: kSecondaryColor
                                ),
                              ),
                            ],
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