import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class SignUpTopSection extends StatelessWidget {
  const SignUpTopSection({super.key});

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
          "Create Account",
          style: getSemiBoldStyle(
            color: ColorsManger.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(8),
        CustomText(
          "We are here to help you!",
          style: getRegularStyle(
            color: ColorsManger.greyColor500,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
