import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/features/bookings/cubit/bookings_cubit.dart';

import '../../../../core/constants/strings_constants.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles_manager.dart';

class BookingsTabBarWidget extends StatelessWidget {
  const BookingsTabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: false,
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: BorderSide(
          color: ColorsManger.primaryColor,
          width: 1.5.w,
        ),
      ),
      indicatorPadding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
      overlayColor: WidgetStateProperty.all(ColorsManger.whiteColor),
      controller: tabController,
      indicatorColor: ColorsManger.primaryColor,
      labelColor: ColorsManger.primaryColor,
      unselectedLabelColor: ColorsManger.greyColor600,
      labelStyle: getBoldStyle(
        color: ColorsManger.primaryColor,
        fontSize: 14.sp,
      ),
      unselectedLabelStyle: getBoldStyle(
        color: ColorsManger.primaryColor,
        fontSize: 14.sp,
      ),
      onTap: (value) {
        context
            .read<BookingsCubit>()
            .changeStatus(
              value == 0
                  ? StringsConstants.upcoming
                  : value == 1
                      ? StringsConstants.completed
                      : StringsConstants.cancelled,
            )
            .then((_) {
          context.read<BookingsCubit>().filterBookingsByStatus();
        });
      },
      tabs: const [
        Tab(text: StringsConstants.upcoming),
        Tab(text: StringsConstants.completed),
        Tab(text: StringsConstants.cancelled),
      ],
    );
  }
}
