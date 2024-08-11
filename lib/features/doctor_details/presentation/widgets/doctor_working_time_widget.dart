import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/spacing.dart';
import '../../../doctors/data/models/doctor_model.dart';

class DoctorWorkingTimeWidget extends StatelessWidget {
  final List<WorkTime> workTimes;
  const DoctorWorkingTimeWidget({
    super.key,
    required this.workTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CustomText(
          "Working Time",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor800,
            fontSize: 20.sp,
          ),
        ),
        verticalSpacing(8),
        ListView.separated(
          shrinkWrap: true,
          itemCount: workTimes.length,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final WorkTime workTime = workTimes[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "${workTime.from} - ${workTime.to}",
                  style: getRegularStyle(
                    color: ColorsManger.greyColor800,
                    fontSize: 14.sp,
                  ),
                ),
                horizontalSpacing(8),
                CustomText(
                  "${workTime.startTime} - ${workTime.endTime}",
                  style: getRegularStyle(
                    color: ColorsManger.greyColor500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              verticalSpacing(10),
        ),
      ],
    );
  }
}
