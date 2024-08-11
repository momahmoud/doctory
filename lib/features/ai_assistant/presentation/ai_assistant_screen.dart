import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper_widgets/custom_app_bar_widget.dart';
import '../../../core/helper_widgets/custom_text_widget.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/spacing.dart';
import '../cubit/ai_assistant_cubit.dart';
import '../cubit/ai_assistant_state.dart';
import 'widgets/doctors_list_widget.dart';
import 'widgets/filter_fields_widget.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText(
          "AI Assistant",
          style: getBoldStyle(
            color: ColorsManger.primaryColor,
            fontSize: 16.sp,
          ),
        ),
      ),
      backgroundColor: ColorsManger.whiteColor,
      body: BlocBuilder<AiAssistantCubit, AiAssistantState>(
        builder: (context, state) {
          final cubit = context.read<AiAssistantCubit>();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  child: Column(
                    children: <Widget>[
                      FilterFieldsWidget(
                        doctors: state.doctors ?? [],
                        cubit: cubit,
                      ),
                      verticalSpacing(20.h),
                      if (state.doctorsBasedOnAi != null &&
                          state.doctorsBasedOnAi!.isNotEmpty)
                        CustomText(
                          "Here are some of our top and nearest doctors based on your description and address:",
                          style: getBoldStyle(
                            color: ColorsManger.primaryColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      if (state.isLoading) const CircularProgressIndicator(),
                      if (state.error != null && state.error!.isNotEmpty)
                        CustomText(
                          state.error!,
                          style: getSemiBoldStyle(
                            color: ColorsManger.redColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      if (state.message != null && state.message!.isNotEmpty)
                        Column(
                          children: [
                            CustomText(
                              '${state.message!.substring(0, state.message!.indexOf('like'))} like:',
                              style: getMediumStyle(
                                color: ColorsManger.primaryColor,
                                fontSize: 14.sp,
                              ),
                            ),
                            CustomText(
                              state.message!.substring(
                                  state.message!.indexOf('like') + 5),
                              style: getSemiBoldStyle(
                                color: ColorsManger.primaryColor,
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                state.doctorsBasedOnAi != null &&
                        state.doctorsBasedOnAi!.isNotEmpty
                    ? DoctorListWidget(
                        doctors: state.doctorsBasedOnAi!,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
