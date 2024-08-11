import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';
import 'package:gemini_comp/core/utils/spacing.dart';
import 'package:gemini_comp/features/home/data/models/category_model.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../cubit/doctors_cubit.dart';

class SpecialtiesListWidget extends StatelessWidget {
  final String currentSpecialty;
  final List<CategoryModel> categories;
  const SpecialtiesListWidget({
    super.key,
    required this.currentSpecialty,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              final cubit = context.read<DoctorsCubit>();
              cubit
                  .changeSpecialist(category.name)
                  .then((value) => cubit.filterDoctorsBySpecialist());
            },
            child: Container(
              height: 37.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: currentSpecialty == category.name
                    ? ColorsManger.primaryColor
                    : ColorsManger.whiteColor,
                border: Border.all(),
              ),
              child: Center(
                child: CustomText(
                  category.name.capitalize(),
                  style: getSemiBoldStyle(
                    color: currentSpecialty == category.name
                        ? ColorsManger.whiteColor
                        : ColorsManger.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            horizontalSpacing(8),
      ),
    );
  }
}
