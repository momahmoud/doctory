import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/helper_widgets/custom_image_widget.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../../doctors/data/models/doctor_model.dart';

class DoctorStatsWidget extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorStatsWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        StatsItem(
          imageName: ImagesConstants.profile2user,
          stats: "${doctor.patients}+",
          label: "Patients",
        ),
        horizontalSpacing(20),
        StatsItem(
          imageName: ImagesConstants.medal,
          stats: "${doctor.experience}+",
          label: "Experience",
        ),
        horizontalSpacing(20),
        StatsItem(
          imageName: ImagesConstants.starFill,
          stats: "${doctor.rating}",
          label: "Rating",
        ),
        horizontalSpacing(20),
        StatsItem(
          imageName: ImagesConstants.messages,
          stats: "${doctor.reviews}",
          label: "Reviews",
        ),
      ],
    );
  }
}

class StatsItem extends StatelessWidget {
  final String imageName;
  final String stats;
  final String label;
  const StatsItem({
    super.key,
    required this.imageName,
    required this.stats,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(13.w),
          decoration: const BoxDecoration(
            color: ColorsManger.greyColor100,
            shape: BoxShape.circle,
          ),
          child: CustomSvgImage(
            imageName: imageName,
            height: 30.h,
            width: 30.h,
          ),
        ),
        verticalSpacing(2),
        CustomText(
          stats,
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor600,
            fontSize: 14.sp,
          ),
        ),
        verticalSpacing(2),
        CustomText(
          label,
          style: getRegularStyle(
            color: ColorsManger.greyColor500,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
