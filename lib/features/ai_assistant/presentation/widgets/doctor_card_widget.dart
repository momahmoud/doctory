import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../../doctors/data/models/doctor_model.dart';

class DoctorCardWidget extends StatelessWidget {
  final DoctorModel doctor;
  final bool? showRating;
  const DoctorCardWidget({
    super.key,
    required this.doctor,
    this.showRating = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showRating == false
          ? null
          : () {
              context.pushNamed(Routes.doctorDetails, arguments: doctor);
            },
      child: Container(
        width: 300.w,
        padding: REdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: ColorsManger.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManger.primaryColor.withOpacity(0.08),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: doctor.image == null
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: 120.w,
                      color: ColorsManger.greyColor200,
                      child: const Icon(Icons.person),
                    )
                  : CustomCachedNetworkImage(
                      imageName: doctor.image ?? "",
                      height: MediaQuery.of(context).size.height,
                      width: 120.w,
                      fit: BoxFit.fitHeight,
                    ),
            ),
            horizontalSpacing(10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      doctor.name.capitalize(),
                      style: getBoldStyle(
                        color: ColorsManger.greyColor800,
                        fontSize: 16.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(8),
                    const Divider(
                      color: ColorsManger.greyColor200,
                      thickness: 1,
                      height: 0,
                    ),
                    verticalSpacing(8),
                    CustomText(
                      doctor.specialist.capitalize(),
                      style: getSemiBoldStyle(
                        color: ColorsManger.greyColor600,
                        fontSize: 14.sp,
                      ),
                    ),
                    if (showRating == true)
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                CustomSvgImage(
                                  imageName: ImagesConstants.star,
                                  height: 16.h,
                                  width: 16.h,
                                  fit: BoxFit.cover,
                                  color: ColorsManger.orangeColor,
                                ),
                                horizontalSpacing(2),
                                CustomText(
                                  doctor.rating.toString(),
                                  style: getRegularStyle(
                                    color: ColorsManger.greyColor500,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Container(
                                  height: 13.h,
                                  width: 1.w,
                                  margin:
                                      REdgeInsets.symmetric(horizontal: 5.w),
                                  color: ColorsManger.greyColor200,
                                ),
                                CustomText(
                                  '${doctor.reviews} ${doctor.reviews > 1 ? " Reviews" : " Review"}',
                                  style: getRegularStyle(
                                    color: ColorsManger.greyColor500,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    verticalSpacing(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSvgImage(
                          imageName: ImagesConstants.location,
                          height: 14.h,
                          width: 14.h,
                        ),
                        horizontalSpacing(5),
                        Expanded(
                          child: CustomText(
                            doctor.address,
                            style: getRegularStyle(
                              color: ColorsManger.greyColor500,
                              fontSize: 12.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
