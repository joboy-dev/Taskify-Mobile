import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({
    super.key, 
    required this.height, 
    required this.outerWidth,  // between 0 and 1
    required this.innerWidth, 
    required this.innerColor, 
    required this.outerColor,
  });

  final double height;
  final double outerWidth;
  /// between 0 and 1
  final double innerWidth;
  final Color innerColor;
  final Color outerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: innerWidth,
      decoration: BoxDecoration(
        color: innerColor,
        borderRadius: BorderRadius.circular(5.r)
      ),
      child: FractionallySizedBox(
        widthFactor: outerWidth > 1 ? 1.0 : outerWidth,  // based on number of completed tasks (completed / total * 1)
        alignment: Alignment.centerLeft,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: outerColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
      ),
    
    );
  }
}