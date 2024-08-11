import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          "Do you have an account ?",
          style: getRegularStyle(
            color: ColorsManger.greyColor500,
            fontSize: 14.sp,
          ),
        ),
        horizontalSpacing(3),
        InkWell(
          onTap: () {
            context.pushReplacementNamed(Routes.register);
          },
          child: CustomText(
            "Sign In",
            style: getMediumStyle(
              color: ColorsManger.blueColor,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }
}
