import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../constants/images_constants.dart';
import '../theme/colors.dart';
import 'custom_image_widget.dart';

class CustomBackButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final bool? isBorder;
  const CustomBackButtonWidget({
    super.key,
    this.onTap,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: ColorsManger.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: isBorder!
              ? Border.all(
                  color: ColorsManger.greyColor500,
                  width: 1.5.w,
                )
              : null,
        ),
        child: CustomSvgImage(
          imageName: ImagesConstants.chevronLeft,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
