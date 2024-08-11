import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../core/helper_widgets/custom_button_widget.dart';
import '../../../core/helper_widgets/custom_text_widget.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/spacing.dart';
import '../../doctors/data/models/doctor_model.dart';
import '../cubit/book_appointment_cubit.dart';
import '../cubit/book_appointment_state.dart';
import 'widgets/appointment_congrats_dialog.dart';
import 'widgets/select_date_widget.dart';
import 'widgets/select_time_widget.dart';

class BookAppointmentScreen extends StatelessWidget {
  final DoctorModel doctor;
  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isCenter: true,
        title: CustomText(
          "Book Appointment",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor700,
            fontSize: 20.sp,
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
              const SelectDateWidget(),
              verticalSpacing(30),
              SelectTimeWidget(workTimes: doctor.workTimes ?? []),
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
        child: BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
          builder: (context, state) {
            bool isValid = state.selectedTime != null &&
                state.selectedDate != null &&
                state.selectedDate!.isNotEmpty &&
                state.selectedTime!.isNotEmpty;
            bool isLoading = state.isLoading != null && state.isLoading!;

            return CustomButtonWidget(
              icon: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: ColorsManger.primaryColor,
                          valueColor:
                              AlwaysStoppedAnimation(ColorsManger.whiteColor),
                        ),
                      ],
                    )
                  : Center(
                      child: CustomText(
                        isValid ? "Confirm" : "Select Date and Time",
                        style: getSemiBoldStyle(
                          color: ColorsManger.whiteColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
              height: 48.h,
              radius: 50.r,
              fontWeight: FontWeight.w500,
              color: isLoading
                  ? ColorsManger.whiteColor
                  : isValid
                      ? ColorsManger.primaryColor
                      : ColorsManger.greyColor400,
              onTap: () {
                if (isValid) {
                  //TODO: Fix patient id
                  context
                      .read<BookAppointmentCubit>()
                      .confirmBooking(doctor: doctor, patientId: "1");
                }
              },
            );
          },
          listener: (BuildContext context, BookAppointmentState state) {
            if (state.success != null && state.success!) {
              showCongratsDialog(
                context,
                doctor.name,
                state.selectedDate!,
                state.selectedTime!,
              );
            }
          },
        ),
      ),
    );
  }
}
