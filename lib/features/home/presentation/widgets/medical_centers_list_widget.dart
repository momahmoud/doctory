import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../data/models/medical_center_model.dart';
import 'medical_center_item_widget.dart';

class MedicalCentersListWidget extends StatelessWidget {
  final List<MedicalCenterModel> medicalCenters;
  const MedicalCentersListWidget({super.key, required this.medicalCenters});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: medicalCenters.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MedicalCenterItemWidget(
            medicalCenter: medicalCenters[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacing(16.w),
      ),
    );
  }
}
