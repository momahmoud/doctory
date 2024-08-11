import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/section_title_widget.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/medical_center_model.dart';
import 'medical_centers_list_widget.dart';

class MedicalCentersSectionWidget extends StatelessWidget {
  final List<MedicalCenterModel> medicalCenters;
  const MedicalCentersSectionWidget({super.key, required this.medicalCenters});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: const SectionTitleWidget(
              title: StringsConstants.nearbyMedicalCenters),
        ),
        verticalSpacing(10.h),
        MedicalCentersListWidget(medicalCenters: medicalCenters),
      ],
    );
  }
}
