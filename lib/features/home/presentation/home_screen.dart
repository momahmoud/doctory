import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/features/home/presentation/widgets/medical_centers_section_widget.dart';

import '../../../core/utils/spacing.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/banner_widget.dart';
import 'widgets/category_section_widget.dart';
import 'widgets/home_top_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: <Widget>[
                      const HomeTopSectionWidget(),
                      const BannerWidget(),
                      verticalSpacing(20.h),
                      CategorySectionWidget(
                        categories: state.categories ?? [],
                      ),
                    ],
                  ),
                ),
                verticalSpacing(16.h),
                MedicalCentersSectionWidget(
                  medicalCenters: state.medicalCenters ?? [],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
