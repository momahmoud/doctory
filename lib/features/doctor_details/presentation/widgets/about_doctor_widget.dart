import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class AboutDoctorWidget extends StatelessWidget {
  final String description;
  const AboutDoctorWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          "About me",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor800,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(8),
        ReadMoreText(
          description,
          style: getRegularStyle(
            color: ColorsManger.greyColor500,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.justify,
          trimMode: TrimMode.Line,
          trimLines: 3,
          trimCollapsedText: 'view more',
          trimExpandedText: 'view less',
          lessStyle: TextStyle(
            color: ColorsManger.greyColor900,
            fontSize: 14.sp,
            decoration: TextDecoration.underline,
          ),
          moreStyle: TextStyle(
            color: ColorsManger.greyColor900,
            fontSize: 14.sp,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
