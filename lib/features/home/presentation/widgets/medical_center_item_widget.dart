import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/constants/images_constants.dart';
import 'package:gemini_comp/core/helper_widgets/custom_image_widget.dart';
import 'package:gemini_comp/core/theme/colors.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/medical_center_model.dart';

class MedicalCenterItemWidget extends StatelessWidget {
  final MedicalCenterModel medicalCenter;
  const MedicalCenterItemWidget({super.key, required this.medicalCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 232.w,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: ColorsManger.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x00000000).withOpacity(0.04),
            blurRadius: 3.r,
            offset: const Offset(7, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 121.h,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  child: CustomCachedNetworkImage(
                    imageName: medicalCenter.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    height: 26.h,
                    width: 27.w,
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: ColorsManger.greyColor800.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: CustomSvgImage(
                        imageName: ImagesConstants.favoriteOut,
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    medicalCenter.name,
                    style: getBoldStyle(
                      color: ColorsManger.greyColor600,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(8.h),
                  Row(
                    children: [
                      CustomSvgImage(
                        imageName: ImagesConstants.location,
                        height: 14.h,
                        width: 14.h,
                      ),
                      horizontalSpacing(2.w),
                      Expanded(
                        child: CustomText(
                          medicalCenter.address,
                          style: getRegularStyle(
                            color: ColorsManger.greyColor500,
                            fontSize: 12.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(8.h),
                  Row(
                    children: <Widget>[
                      CustomText(
                        medicalCenter.rating.toString(),
                        style: getSemiBoldStyle(
                          color: ColorsManger.greyColor500,
                          fontSize: 12.sp,
                        ),
                      ),
                      horizontalSpacing(4.w),
                      SizedBox(
                        height: 10.h,
                        width: 60.w,
                        child: ListView.separated(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (itemBuilder, index) {
                            return CustomSvgImage(
                              imageName: ImagesConstants.star,
                              height: 10.h,
                              width: 10.h,
                              color: medicalCenter.rating!.round() > index
                                  ? ColorsManger.orangeColor
                                  : ColorsManger.greyColor400,
                            );
                          },
                          separatorBuilder: (separatorBuilder, index) {
                            return horizontalSpacing(1.w);
                          },
                        ),
                      ),
                      horizontalSpacing(4.w),
                      Expanded(
                        child: CustomText(
                          "(${medicalCenter.reviews} ${medicalCenter.reviews == 1 ? "Review" : "Reviews"})",
                          style: getRegularStyle(
                            color: ColorsManger.greyColor500,
                            fontSize: 12.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(12.h),
                  const Divider(
                    color: ColorsManger.greyColor300,
                    thickness: 1,
                    height: 0,
                  ),
                  verticalSpacing(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CustomSvgImage(
                            imageName: ImagesConstants.routing,
                            height: 16.h,
                            width: 16.h,
                          ),
                          horizontalSpacing(2.w),
                          CustomText(
                            medicalCenter.distance,
                            style: getRegularStyle(
                              color: ColorsManger.greyColor500,
                              fontSize: 12.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      horizontalSpacing(16.h),
                      Row(
                        children: <Widget>[
                          CustomSvgImage(
                            imageName: ImagesConstants.hospital,
                            height: 16.h,
                            width: 16.h,
                          ),
                          horizontalSpacing(2.w),
                          CustomText(
                            medicalCenter.type,
                            style: getRegularStyle(
                              color: ColorsManger.greyColor500,
                              fontSize: 12.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
