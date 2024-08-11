import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/styles_manager.dart';
import '../utils/spacing.dart';
import 'custom_text_widget.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  final int? reviewCount;
  final Color? color;
  const CustomRatingWidget({
    super.key,
    required this.rating,
    this.reviewCount,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // CustomSvgImage(
        //   imageName: ImagesConstants.star,
        //   color: color,
        //   height: 16.h,
        //   width: 16.h,
        // ),
        horizontalSpacing(8),
        CustomText(
          "$rating ($reviewCount)",
          style: getRegularStyle(
            color: color ?? ColorsManger.primaryColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
