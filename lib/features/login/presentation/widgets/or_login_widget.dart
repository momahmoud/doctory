import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class OrLoginWidget extends StatelessWidget {
  const OrLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1.h,
            color: ColorsManger.greyColor200,
          ),
        ),
        horizontalSpacing(15.h),
        CustomText(
          "or",
          style: getMediumStyle(
            color: ColorsManger.greyColor500,
            fontSize: 16.sp,
          ),
        ),
        horizontalSpacing(15.h),
        Expanded(
          child: Container(
            height: 1.h,
            color: ColorsManger.greyColor200,
          ),
        ),
      ],
    );
  }
}
