import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/strings_constants.dart';
import '../../../core/helper_widgets/custom_text_widget.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/bookings_tab_bar_widget.dart';
import 'widgets/tab_bar_body_widget.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: CustomText(
            StringsConstants.myAppointment,
            style: getSemiBoldStyle(
              color: ColorsManger.greyColor700,
              fontSize: 20.sp,
            ),
          ),
        ),
        verticalSpacing(4.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BookingsTabBarWidget(tabController: tabController),
        ),
        TabBarBodyWidget(tabController: tabController),
      ],
    );
  }
}
