import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/constants/images_constants.dart';
import 'package:gemini_comp/core/helper_widgets/custom_image_widget.dart';

import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/location_helper.dart';
import '../../../../core/utils/spacing.dart';
import '../../cubit/ai_assistant_cubit.dart';
import '../../../doctors/data/models/doctor_model.dart';

class FilterFieldsWidget extends StatelessWidget {
  final AiAssistantCubit cubit;
  final List<DoctorModel>? doctors;
  const FilterFieldsWidget({super.key, required this.cubit, this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextFormField(
          lines: 3,
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
          hint: 'example: I have a pain in my knee',
          label: "Can you describe the pain you're feeling?",
          controller: cubit.descriptionController,
        ),
        verticalSpacing(10.h),
        CustomTextFormField(
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
          hint: 'Type your address or click on the buttons',
          label: "What is your address?",
          lines: 2,
          controller: cubit.addressController,
          suffixIcon: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  await LocationHelper.determinePosition().then((value) {
                    cubit.getAddress(value);
                  });
                },
                child: CustomSvgImage(
                  imageName: ImagesConstants.gps,
                  height: 25.h,
                  width: 25.h,
                ),
              ),
              horizontalSpacing(5),
              InkWell(
                onTap: () {
                  print("map");
                },
                child: CustomSvgImage(
                  imageName: ImagesConstants.map,
                  height: 25.h,
                  width: 25.h,
                ),
              )
            ],
          ),
        ),
        verticalSpacing(30.h),
        CustomButtonWidget(
          text: "Find Doctor",
          onTap: () {
            cubit.trainingModel(doctors!);
          },
          color: ColorsManger.primaryColor,
          textColor: ColorsManger.whiteColor,
          height: 44.h,
        ),
      ],
    );
  }
}
