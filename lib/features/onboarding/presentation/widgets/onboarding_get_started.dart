import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/shared_prefs.dart';

class OnBoardingGetStarted extends StatelessWidget {
  const OnBoardingGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: CustomButtonWidget(
        onTap: () {
          SharedPreferencesService.saveData("seen", true);
          context.pushNamed(Routes.login);
        },
        color: ColorsManger.primaryColor,
        height: 44.h,
        radius: 16.r,
        textColor: ColorsManger.whiteColor,
        fontSize: 14.sp,
        text: StringsConstants.onboardingGetStarted,
      ),
    );
  }
}
