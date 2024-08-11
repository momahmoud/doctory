import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../cubit/book_appointment_cubit.dart';
import '../../cubit/book_appointment_state.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          "Select Date",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor700,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(16),
        Container(
          decoration: BoxDecoration(
              color: ColorsManger.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: ColorsManger.greyColor200,
                  blurRadius: 8.r,
                  offset: const Offset(0, 4),
                ),
              ]),
          child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
            builder: (context, state) {
              return CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayHighlightColor: ColorsManger.primaryColor,
                  selectedDayTextStyle: getBoldStyle(
                    color: ColorsManger.whiteColor,
                    fontSize: 12.sp,
                  ),
                  hideYearPickerDividers: true,
                  dayTextStyle: getBoldStyle(
                    color: ColorsManger.greyColor500,
                    fontSize: 12.sp,
                  ),
                  controlsTextStyle: getBoldStyle(
                    color: ColorsManger.greyColor900,
                    fontSize: 14.sp,
                  ),
                  dayBorderRadius: BorderRadius.circular(8.r),
                  disableModePicker: true,
                  disabledDayTextStyle: getBoldStyle(
                    color: ColorsManger.greyColor300,
                    fontSize: 12.sp,
                  ),
                  calendarViewScrollPhysics: const BouncingScrollPhysics(),
                  weekdayLabelTextStyle: getSemiBoldStyle(
                    color: ColorsManger.greyColor600,
                    fontSize: 12.sp,
                  ),
                  weekdayLabels: [
                    "Sun",
                    "Mon",
                    "Tue",
                    "Wed",
                    "Thu",
                    "Fri",
                    "Sat"
                  ],
                  disableMonthPicker: true,
                  currentDate: DateTime.now(),
                  selectableDayPredicate: (day) {
                    if (day.isBefore(DateTime.now())) {
                      return false;
                    }
                    return true;
                  },
                ),
                value: [DateTime.parse(state.selectedDate!)],
                onValueChanged: (dates) {
                  context
                      .read<BookAppointmentCubit>()
                      .setSelectedDate(dates.first.toIso8601String());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
