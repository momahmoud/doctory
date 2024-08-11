import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/helper_functions.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/booking_model.dart';
import 'booking_doctor_card_widget.dart';

class BookingCardWidget extends StatelessWidget {
  final BookingModel booking;
  final String appointmentStatus;
  const BookingCardWidget({
    super.key,
    required this.booking,
    required this.appointmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManger.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManger.primaryColor.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppointmentDateAndTimeWidget(
                date: booking.date,
                time: booking.time,
              ),
              Container(
                height: 1.h,
                margin: EdgeInsets.symmetric(vertical: 12.w),
                decoration: BoxDecoration(
                  color: ColorsManger.greyColor200,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ],
          ),
          BookingDoctorCardWidget(doctor: booking),
          Container(
            height: 1.h,
            margin: EdgeInsets.symmetric(vertical: 12.w),
            decoration: BoxDecoration(
              color: ColorsManger.greyColor200,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          if (booking.status == "upcoming" || booking.status == "completed")
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    text: booking.status == "upcoming"
                        ? StringsConstants.cancelAppointment
                        : "Re-Book",
                    fontSize: 14.sp,
                    radius: 24.r,
                    height: 38.h,
                    color: ColorsManger.greyColor200,
                    textColor: ColorsManger.primaryColor,
                    onTap: () {
                      // TODO: implement cancel appointment
                    },
                  ),
                ),
                horizontalSpacing(16),
                Expanded(
                  child: CustomButtonWidget(
                    text: booking.status == "upcoming"
                        ? StringsConstants.reschedule
                        : "Add Review",
                    fontSize: 14.sp,
                    radius: 24.r,
                    height: 38.h,
                    color: ColorsManger.primaryColor,
                    onTap: () {
                      // TODO: implement reschedule
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class AppointmentDateAndTimeWidget extends StatelessWidget {
  final String date;
  final String time;
  const AppointmentDateAndTimeWidget({
    super.key,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          formatDate(date),
          style: getBoldStyle(
            color: ColorsManger.greyColor800,
            fontSize: 14.sp,
          ),
        ),
        Container(
          height: 15.h,
          width: 1.w,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: ColorsManger.greyColor400,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        CustomText(
          time,
          style: getBoldStyle(
            color: ColorsManger.greyColor800,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
