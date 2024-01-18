import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/shared/constants.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.dashboard_outlined, size: 24.sp, color: kSecondaryColor,),
              SizedBox(width: 20.w),
              Text(
                'Task Productivity',
                style: kNormalTextStyle(context).copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),

          SizedBox(
            height: 350.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tasks in 7 days',
                    style: kNormalTextStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // bar chart
              
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                        width: double.infinity,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceEvenly,
                            maxY: 200,
                            borderData: FlBorderData(
                              show: true,
                              border: Border(
                                top: BorderSide(color: kMainColor(context), width: 0.1.w),
                                bottom: BorderSide(color: kMainColor(context), width: 0.1.w),
                              ),
                            ),
                            gridData: const FlGridData(
                              drawVerticalLine: false,
                              horizontalInterval: 100.0,
                            ),
                            titlesData: FlTitlesData(
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                              bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true, 
                                  interval: 100.0,
                                  reservedSize: 30.w,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      '${value.round()}',
                                      style: kSecondaryNormalTextStyle(context).copyWith(
                                        fontSize: 12.sp
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: kNeutralDark,
                                tooltipHorizontalOffset: 5.r,  
                                tooltipPadding: EdgeInsets.all(20.r)  ,
                                tooltipRoundedRadius: 16.sp
                              ),
                              handleBuiltInTouches: true,
                              allowTouchBarBackDraw: true,
                              enabled: true,
                              touchExtraThreshold: EdgeInsets.all(40.r)
                            ),
                            barGroups: List.generate(7, (index) {
                              Random random = Random();
                      
                              return BarChartGroupData(
                                groupVertically: true,
                                x: index + 1,
                                barRods: [
                                  BarChartRodData(
                                    toY: (random.nextInt(200))/1,
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(5.r),
                                    width: 8.w,
                                  ),
                      
                                  BarChartRodData(
                                    toY: (random.nextInt(100))/1,
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(5.r),
                                    width: 8.w,
                                  ),
                                ],
                              );
                            }
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
              
                      // Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(2, (index) {
                          return Row(
                            children: [
                              Container(
                                height: 16.h,
                                width: 8.w,
                                decoration: BoxDecoration(
                                  color: index == 0 ? kSecondaryColor : kPrimaryColor,
                                  borderRadius: BorderRadius.circular(4.r)
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                index == 0 ?'Tasks' : 'Projects',
                                style: kNormalTextStyle(context).copyWith(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          );
                        })
                      )
                    ],
                  ),
                  // Bar Chart end

                  SizedBox(height: 20.h),

              
                  Text(
                    'Tasks in this month',
                    style: kNormalTextStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                    ),
                  ),
                  SizedBox(height: 20.h),


                  // Line Chart 
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: LineChart(
                      LineChartData(
                        maxY: 200,
                        minY: 0,
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            top: BorderSide(color: kMainColor(context), width: 0.1.w),
                            bottom: BorderSide(color: kMainColor(context), width: 0.1.w),
                          ),
                        ),
                        gridData: const FlGridData(
                          drawVerticalLine: false,
                          horizontalInterval: 100.0,
                        ),
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                          bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true, 
                              interval: 100.0,
                              reservedSize: 30.w,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${value.round()}',
                                  style: kSecondaryNormalTextStyle(context).copyWith(
                                    fontSize: 12.sp
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: kNeutralDark,
                            tooltipHorizontalOffset: 5.r,  
                            tooltipPadding: EdgeInsets.all(20.r),
                            tooltipRoundedRadius: 16.sp
                          ),
                          handleBuiltInTouches: true,
                          enabled: true,
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(5, (index) {
                              Random random = Random();
                              return FlSpot(index/1, random.nextInt(100)/1);
                            }
                            ),
                            color: kNeutralLightGrey,
                            isCurved: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            barWidth: 5.w,
                          ),

                          LineChartBarData(
                            spots: List.generate(5, (index) {
                              Random random = Random();
                              return FlSpot(index/1, random.nextInt(200)/1);
                            }
                            ),
                            color: kPrimaryColor,
                            isCurved: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            barWidth: 5.w,
                          ),
                        ]
                      ),
                    ),
                  ),

                  // Line Chart end

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}