import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/features/home/cubit/home_state.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../cubit/home_cubit.dart';

class HomeTopSectionWidget extends StatelessWidget {
  const HomeTopSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0.h),
              child: CustomSvgImage(
                imageName: ImagesConstants.locationMap,
                height: 20.h,
                width: 20.h,
              ),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return CustomText(
                        state.currentLocation.isEmpty
                            ? "Current Location"
                            : state.currentLocation,
                        style: getSemiBoldStyle(
                          color: ColorsManger.greyColor700,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      );
                    },
                  ),
                ],
              ),
            ),
            horizontalSpacing(12),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.notifications);
              },
              child: Container(
                width: 34.h,
                height: 34.h,
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.w),
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    CustomSvgImage(
                      imageName: ImagesConstants.bell,
                      height: 20.h,
                      width: 20.h,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Badge(
                        backgroundColor: ColorsManger.redColor,
                        smallSize: 8.sp,
                        largeSize: 8.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        verticalSpacing(8),
        CustomTextFormField(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          fillColor: ColorsManger.greyColor100,
          hint: StringsConstants.searchPlaceholder,
          prefixIcon: const CustomSvgImage(
            imageName: ImagesConstants.searchNormal,
            color: ColorsManger.greyColor400,
          ),
        ),
      ],
    );
  }
}
