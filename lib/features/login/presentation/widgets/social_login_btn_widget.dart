import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class SocialLoginBtnWidget extends StatelessWidget {
  final String? text;
  final String imageName;
  const SocialLoginBtnWidget({
    super.key,
    required this.text,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorsManger.whiteColor,
        border: Border.all(
          color: ColorsManger.greyColor200,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSvgImage(
            imageName: imageName,
            height: 20.h,
            width: 20.h,
          ),
          horizontalSpacing(8),
          CustomText(
            text!,
            style: getMediumStyle(
              color: ColorsManger.primaryColor,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
