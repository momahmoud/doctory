import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPngImageWidget(
          imageName: illustration,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        verticalSpacing(29),
        CustomText(
          title,
          style: getBoldStyle(
            color: ColorsManger.greyColor700,
            fontSize: 18.sp,
          ),
        ),
        verticalSpacing(8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: CustomText(
            text,
            style: getRegularStyle(
              color: ColorsManger.greyColor500,
              fontSize: 14,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
