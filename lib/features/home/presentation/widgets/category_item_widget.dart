import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';
import 'package:gemini_comp/features/home/data/models/category_model.dart';

import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryItemWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84.h,
      width: 62.w,
      child: Column(
        children: <Widget>[
          Container(
            height: 62.h,
            width: 62.h,
            margin: EdgeInsets.only(bottom: 5.h),
            decoration: BoxDecoration(
              color: Color((int.parse("0xFF${category.color}"))),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: category.image!.contains("svg")
                  ? CustomSvgImageNetwork(
                      imageName: category.image,
                      height: 24.h,
                      width: 24.h,
                      color: ColorsManger.whiteColor,
                    )
                  : CustomCachedNetworkImage(
                      imageName: category.image,
                      height: 24.h,
                      width: 24.h,
                      color: ColorsManger.whiteColor,
                    ),
            ),
          ),
          CustomText(
            category.name.capitalize(),
            style: getBoldStyle(
              color: ColorsManger.greyColor600,
              fontSize: 12.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
