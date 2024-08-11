import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/helper_widgets/custom_button_widget.dart';
import 'package:gemini_comp/core/routing/routes.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../../../core/constants/images_constants.dart';
import '../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../core/helper_widgets/custom_image_widget.dart';
import '../../../core/helper_widgets/custom_text_widget.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/spacing.dart';
import '../../doctors/data/models/doctor_model.dart';
import '../../ai_assistant/presentation/widgets/doctor_card_widget.dart';
import 'widgets/about_doctor_widget.dart';
import 'widgets/doctor_reviews_widget.dart';
import 'widgets/doctor_stats_widget.dart';
import 'widgets/doctor_working_time_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isCenter: true,
        title: CustomText(
          "Doctor Details",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor700,
            fontSize: 20.sp,
          ),
        ),
        actionIcon: Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: InkWell(
            splashColor: Colors.white,
            highlightColor: Colors.white,
            onTap: () {
              // TODO: Add Favourite
            },
            child: CustomSvgImage(
              imageName: ImagesConstants.favoriteOut,
              height: 24.h,
              width: 24.h,
              color: ColorsManger.primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 140.h,
                width: double.infinity,
                child: DoctorCardWidget(
                  doctor: doctor,
                  showRating: false,
                ),
              ),
              verticalSpacing(26),
              DoctorStatsWidget(doctor: doctor),
              verticalSpacing(20),
              AboutDoctorWidget(
                description: doctor.description ?? "",
              ),
              verticalSpacing(20),
              DoctorWorkingTimeWidget(
                workTimes: doctor.workTimes ?? [],
              ),
              verticalSpacing(25),
              DoctorReviewsWidget(
                review: doctor.reviewsList ?? [],
              ),
              verticalSpacing(60),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: 20.h,
          top: 10.h,
        ),
        child: CustomButtonWidget(
          text: "Book Appointment",
          height: 48.h,
          radius: 50.r,
          onTap: () {
            context.pushNamed(Routes.bookAppointment, arguments: doctor);
          },
        ),
      ),
    );
  }
}
