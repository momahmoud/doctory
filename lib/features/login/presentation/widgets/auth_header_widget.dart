import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSvgImage(
          imageName: ImagesConstants.docLogo,
          height: 77.h,
          width: 77.h,
        ),
        verticalSpacing(30.h),
        CustomText(
          "Hi, Welcome Back!",
          style: getSemiBoldStyle(
            color: ColorsManger.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(8),
        CustomText(
          "Hope you’re doing fine.",
          style: getRegularStyle(
            color: ColorsManger.greyColor500,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
