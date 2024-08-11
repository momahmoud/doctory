import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';
import 'package:gemini_comp/features/bookings/data/models/booking_model.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';

class BookingDoctorCardWidget extends StatelessWidget {
  final BookingModel doctor;
  const BookingDoctorCardWidget({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109.h,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          // TODO: Add Doctor Details
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: doctor.doctorImage == null
                  ? Container(
                      height: double.infinity,
                      width: 100,
                      color: ColorsManger.greyColor200,
                      child: const Icon(Icons.person),
                    )
                  : CustomCachedNetworkImage(
                      imageName: doctor.doctorImage ?? "",
                      height: double.infinity,
                      width: 109.w,
                      fit: BoxFit.fitHeight,
                    ),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      doctor.doctorName!.startsWith("Dr.")
                          ? doctor.doctorName
                          : "Dr. ${doctor.doctorName!.capitalize()}",
                      style: getBoldStyle(
                        color: ColorsManger.greyColor800,
                        fontSize: 16.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(8),
                    CustomText(
                      doctor.doctorSpecialist!.capitalize(),
                      style: getSemiBoldStyle(
                        color: ColorsManger.greyColor600,
                        fontSize: 14.sp,
                      ),
                    ),
                    verticalSpacing(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSvgImage(
                          imageName: ImagesConstants.location,
                          height: 14.h,
                          width: 14.h,
                        ),
                        horizontalSpacing(5),
                        Expanded(
                          child: CustomText(
                            doctor.doctorAddress,
                            style: getRegularStyle(
                              color: ColorsManger.greyColor600,
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
