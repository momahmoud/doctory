import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/theme/styles_manager.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../cubit/bookings_cubit.dart';
import '../../cubit/bookings_state.dart';
import 'bookings_list_widget.dart';

class TabBarBodyWidget extends StatelessWidget {
  const TabBarBodyWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BookingsCubit, BookingsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManger.primaryColor,
              ),
            );
          }

          if (state.error != null) {
            return Center(
              child: CustomText(
                state.error!,
                style: getMediumStyle(
                  color: ColorsManger.redColor,
                  fontSize: 16.sp,
                ),
              ),
            );
          }
          return tabController.index == 0
              ? BookingsListWidget(
                  doctors: state.filteredBookings ?? [],
                  appointmentStatus: 'upcoming',
                )
              : tabController.index == 1
                  ? BookingsListWidget(
                      doctors: state.filteredBookings ?? [],
                      appointmentStatus: 'completed',
                    )
                  : BookingsListWidget(
                      doctors: state.filteredBookings ?? [],
                      appointmentStatus: 'cancelled',
                    );
        },
      ),
    );
  }
}
