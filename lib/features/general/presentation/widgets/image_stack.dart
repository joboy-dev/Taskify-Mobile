import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskify/core/constants/constants.dart';

class ImageStackHorizontal extends StatelessWidget {
  const ImageStackHorizontal({
    super.key, 
    required this.imagePaths,
    required this.imageRadius,
  });

  final List<String> imagePaths;
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    return imagePaths.length > 3 ? SizedBox(
      height: imageRadius * 2,
      width: 90.w,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ...imagePaths.sublist(0,3).map(
            (image) => Positioned(
              left: imagePaths.indexOf(image) * 20.r,
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: kMainColor(context).withOpacity(0.2),
                backgroundImage: AssetImage(image),
                minRadius: imageRadius,
              ),
            )
          ).toList(),
          
          Positioned(
            left: 3 * 20.r,
            bottom: 0,
            child: CircleAvatar(
              minRadius: imageRadius,
              backgroundColor: kSecondaryColor,
              child: Center(
                child: Text(
                  '+${imagePaths.length - 3}',
                  style: kNormalTextStyle(context).copyWith(
                    color: kNeutralLight
                  ),
                ),
              ),
            )
          )
        ],
      ),
    ) : SizedBox(
      height: imageRadius * 2,
      width: 80.w,
      child: Stack(
        children: imagePaths.map(
          (image) => Positioned(
            left: imagePaths.indexOf(image) * 20.r,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: kMainColor(context).withOpacity(0.2),
              backgroundImage: AssetImage(image),
              minRadius: imageRadius,
            ),
          )
        ).toList(),
      ),
    );
  }
}