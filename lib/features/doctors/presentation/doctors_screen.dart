import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/helper_widgets/custom_app_bar_widget.dart';
import 'package:gemini_comp/core/helper_widgets/custom_text_widget.dart';
import 'package:gemini_comp/core/theme/styles_manager.dart';

import '../../../core/constants/images_constants.dart';
import '../../../core/constants/strings_constants.dart';
import '../../../core/helper_widgets/custom_image_widget.dart';
import '../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/spacing.dart';
import '../../ai_assistant/presentation/widgets/doctor_card_widget.dart';
import '../../home/data/models/category_model.dart';
import '../cubit/doctors_cubit.dart';
import '../cubit/doctors_state.dart';
import 'widgets/specialties_list_widget.dart';

class DoctorsScreen extends StatelessWidget {
  final List<CategoryModel> categories;
  const DoctorsScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isCenter: true,
        title: CustomText(
          "All Doctors",
          style: getSemiBoldStyle(
            color: ColorsManger.greyColor700,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: BlocBuilder<DoctorsCubit, DoctorsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: CustomTextFormField(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    fillColor: ColorsManger.greyColor100,
                    hint: StringsConstants.searchPlaceholder,
                    prefixIcon: const CustomSvgImage(
                      imageName: ImagesConstants.searchNormal,
                      color: ColorsManger.greyColor400,
                    ),
                  ),
                ),
                verticalSpacing(18),
                SpecialtiesListWidget(
                  currentSpecialty: state.selectedSpecialist,
                  categories: [
                    CategoryModel(id: "all", name: "All"),
                    ...state.specialists,
                  ],
                ),
                verticalSpacing(18),
                state.isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : state.filteredDoctors.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Center(
                              child: CustomText(
                                "No doctors found",
                                style: getMediumStyle(
                                  color: ColorsManger.primaryColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.filteredDoctors.length,
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              itemBuilder: (context, index) {
                                final doctor = state.filteredDoctors[index];
                                return SizedBox(
                                  height: 155.h,
                                  child: DoctorCardWidget(doctor: doctor),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return verticalSpacing(18);
                              },
                            ),
                          ),
              ],
            );
          },
        ),
      ),
    );
  }
}
