import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/helper_widgets/section_title_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../../doctors/data/models/doctor_model.dart';

class DoctorReviewsWidget extends StatelessWidget {
  final List<ReviewModel> review;
  const DoctorReviewsWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitleWidget(
          title: "Reviews",
          onTap: () {},
        ),
        verticalSpacing(16),
        ListView.separated(
          shrinkWrap: true,
          itemCount: review.length > 2 ? 2 : review.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final ReviewModel reviewModel = review[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child:
                          reviewModel.image == null || reviewModel.image == ""
                              ? Container(
                                  height: 57.h,
                                  width: 57.h,
                                  color: ColorsManger.greyColor200,
                                  child: const Icon(Icons.person),
                                )
                              : CustomCachedNetworkImage(
                                  imageName: reviewModel.image ?? "",
                                  height: 57.h,
                                  width: 57.h,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    horizontalSpacing(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          reviewModel.name!.capitalize(),
                          style: getBoldStyle(
                            color: ColorsManger.greyColor700,
                            fontSize: 16.sp,
                          ),
                        ),
                        verticalSpacing(8),
                        Row(
                          children: [
                            CustomText(
                              "${reviewModel.rating}",
                              style: getSemiBoldStyle(
                                color: ColorsManger.greyColor500,
                                fontSize: 12.sp,
                              ),
                            ),
                            horizontalSpacing(4.w),
                            SizedBox(
                              height: 12.h,
                              width: 77.w,
                              child: ListView.separated(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (itemBuilder, index) {
                                  return CustomSvgImage(
                                    imageName: ImagesConstants.star,
                                    height: 12.h,
                                    width: 12.h,
                                    color: reviewModel.rating!.round() > index
                                        ? ColorsManger.orangeColor
                                        : ColorsManger.greyColor400,
                                  );
                                },
                                separatorBuilder: (separatorBuilder, index) {
                                  return horizontalSpacing(3.w);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpacing(8),
                CustomText(
                  reviewModel.description,
                  style: getRegularStyle(
                    color: ColorsManger.greyColor500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              verticalSpacing(15),
        ),
      ],
    );
  }
}
