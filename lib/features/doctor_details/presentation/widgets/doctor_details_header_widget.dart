import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class DoctorDetailsHeaderWidget extends StatelessWidget {
  const DoctorDetailsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            context.pop();
          },
          child: CustomSvgImage(
            imageName: ImagesConstants.arrowLeft,
            height: 24.h,
            width: 24.h,
            color: ColorsManger.primaryColor,
          ),
        ),
        Expanded(
          child: CustomText(
            "Doctor Details",
            style: getSemiBoldStyle(
              color: ColorsManger.greyColor700,
              fontSize: 20.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: () {
            // TODO: Add Favourite
          },
          child: CustomSvgImage(
            imageName: ImagesConstants.favoriteOut,
            height: 24.h,
            width: 24.h,
            color: ColorsManger.primaryColor,
          ),
        ),
      ],
    );
  }
}
