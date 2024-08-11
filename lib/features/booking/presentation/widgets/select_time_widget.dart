import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/features/booking/cubit/book_appointment_cubit.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../../doctors/data/models/doctor_model.dart';
import '../../cubit/book_appointment_state.dart';

class SelectTimeWidget extends StatelessWidget {
  final List<WorkTime> workTimes;
  const SelectTimeWidget({super.key, required this.workTimes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          "Select Hour",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor700,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(16),
        GridView.builder(
          shrinkWrap: true,
          itemCount:
              _generateTimeList(workTimes[0].startTime!, workTimes[0].endTime!)
                  .length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 2.2.h,
          ),
          itemBuilder: (context, index) {
            final time = _generateTimeList(
                workTimes[0].startTime!, workTimes[0].endTime!)[index];
            return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context.read<BookAppointmentCubit>().setSelectedTime(time);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: state.selectedTime == time
                          ? ColorsManger.primaryColor
                          : ColorsManger.greyColor50,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: CustomText(
                      time,
                      style: getSemiBoldStyle(
                        color: state.selectedTime == time
                            ? ColorsManger.whiteColor
                            : ColorsManger.greyColor500,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

List<String> _generateTimeList(String startTime, String endTime) {
  List<String> timeList = [];
  DateTime startDateTime =
      DateTime.parse("2024-07-30 ${convertTo24Hour(startTime)}");
  DateTime endDateTime =
      DateTime.parse("2024-07-30 ${convertTo24Hour(endTime)}");

  while (startDateTime.hour < endDateTime.hour ||
      (startDateTime.hour == endDateTime.hour &&
          startDateTime.minute <= endDateTime.minute)) {
    if (!(startDateTime.hour >= 12 && startDateTime.hour < 13)) {
      timeList.add(convertTo12Hour(startDateTime.hour, startDateTime.minute));
    }
    startDateTime = startDateTime.add(const Duration(minutes: 30));
  }

  return timeList;
}

String convertTo24Hour(String time) {
  List<String> parts = time.split(" ");
  String hour = parts[0].split(":")[0];
  String minute = parts[0].contains(":") ? parts[0].split(":")[1] : "00";
  String amPm = parts[1];

  if (amPm == "PM" && hour != "12") {
    hour = (int.parse(hour) + 12).toString();
  } else if (amPm == "AM" && hour == "12") {
    hour = "00";
  }

  // Add leading zero to hour if necessary
  if (hour.length == 1) {
    hour = "0$hour";
  }

  return "$hour:$minute";
}

String convertTo12Hour(int hour, int minute) {
  String amPm = hour < 12 ? " AM" : " PM";
  hour = hour % 12;
  if (hour == 0) {
    hour = 12;
  }

  return "$hour:${minute < 10 ? "0$minute" : minute.toString()}$amPm";
}
