import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const SectionTitleWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomText(
          title,
          style: getBoldStyle(
            color: ColorsManger.primaryColor,
            fontSize: 16.sp,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            StringsConstants.seeAll,
            style: getMediumStyle(
              color: ColorsManger.greyColor500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
