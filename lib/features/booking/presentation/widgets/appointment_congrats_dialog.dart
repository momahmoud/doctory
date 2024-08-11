import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/helper_widgets/custom_button_widget.dart';
import 'package:gemini_comp/core/routing/routes.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/spacing.dart';

void showCongratsDialog(
  BuildContext context,
  String doctorName,
  String date,
  String time,
) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        backgroundColor: ColorsManger.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 131.h,
              width: 131.h,
              padding: EdgeInsets.all(35.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManger.lightTealColor,
              ),
              child: CustomSvgImage(
                imageName: ImagesConstants.shieldTick,
                height: 60.h,
                width: 60.h,
              ),
            ),
            verticalSpacing(20),
            CustomText(
              'Congratulations!',
              style: getSemiBoldStyle(
                color: ColorsManger.primaryColor,
                fontSize: 20.sp,
              ),
            ),
            verticalSpacing(20),
            CustomText(
              'Your appointment with Dr. $doctorName is confirmed for ${formatDate(date)}, at $time. ',
              style: getRegularStyle(
                color: ColorsManger.greyColor500,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(30),
            CustomButtonWidget(
              height: 48.h,
              radius: 50.r,
              fontWeight: FontWeight.w500,
              color: ColorsManger.primaryColor,
              onTap: () {
                context.pop();
                context.pushReplacementNamed(Routes.bookings);
              },
              text: "Done",
            ),
            verticalSpacing(5),
            CustomButtonWidget(
              height: 48.h,
              radius: 50.r,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              textColor: ColorsManger.primaryColor,
              color: ColorsManger.whiteColor,
              onTap: () {
                //TODO: Edit your appointment
                Navigator.pop(context);
              },
              text: "Edit your appointment",
            )
          ],
        ),
      );
    },
  );
}
