import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/routing/routes.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      margin: EdgeInsets.only(top: 14.h),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12.r),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagesConstants.banner),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
            StringsConstants.bookAndSchedule,
            style: getBoldStyle(
              color: ColorsManger.whiteColor,
              fontSize: 18.sp,
              height: 1.2.h,
            ),
          ),
          verticalSpacing(5.h),
          CustomText(
            StringsConstants.scheduleAppointment,
            style: getRegularStyle(
              color: ColorsManger.whiteColor,
              fontSize: 12.sp,
            ),
          ),
          verticalSpacing(10.h),
          CustomButtonWidget(
            width: 109.w,
            height: 35.h,
            onTap: () {
              context.pushNamed(Routes.aiAssistant);
            },
            color: ColorsManger.whiteColor,
            text: StringsConstants.aiAssistant,
            textColor: ColorsManger.primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            radius: 44.r,
          )
        ],
      ),
    );
  }
}
