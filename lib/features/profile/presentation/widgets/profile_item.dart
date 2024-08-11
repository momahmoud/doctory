import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/constants/images_constants.dart';
import 'package:gemini_comp/core/helper_widgets/custom_image_widget.dart';
import 'package:gemini_comp/core/helper_widgets/custom_text_widget.dart';
import 'package:gemini_comp/core/theme/colors.dart';
import 'package:gemini_comp/core/theme/styles_manager.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool? withTrailing;
  final bool? withDivider;
  final Function()? onTap;
  const ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    this.withTrailing = true,
    this.onTap,
    this.withDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap ?? () {},
          contentPadding: EdgeInsets.zero,
          title: CustomText(
            title,
            style: getRegularStyle(
              color: ColorsManger.greyColor500,
              fontSize: 18.sp,
            ),
          ),
          minLeadingWidth: 10.w,
          leading: icon.isNotEmpty
              ? CustomSvgImage(
                  imageName: icon,
                  height: 24.h,
                  width: 24.h,
                  color: ColorsManger.greyColor500,
                )
              : null,
          trailing: withTrailing!
              ? CustomSvgImage(
                  imageName: ImagesConstants.chevronRight,
                  height: 14.h,
                  width: 14.h,
                  color: ColorsManger.greyColor500,
                )
              : null,
        ),
        if (withDivider!)
          Container(
            height: 1.h,
            decoration: BoxDecoration(
              color: ColorsManger.greyColor200,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
      ],
    );
  }
}
