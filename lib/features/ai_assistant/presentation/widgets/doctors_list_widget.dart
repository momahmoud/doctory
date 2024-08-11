import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../doctors/data/models/doctor_model.dart';
import 'doctor_card_widget.dart';

class DoctorListWidget extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorListWidget({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: doctors.length,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorCardWidget(doctor: doctor);
        },
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacing(10),
      ),
    );
  }
}
