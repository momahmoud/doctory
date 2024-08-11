import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../cubit/main_cubit.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return ConvexAppBar(
      style: TabStyle.flip,
      backgroundColor: ColorsManger.whiteColor,
      color: ColorsManger.primaryColor,
      activeColor: ColorsManger.primaryColor,
      elevation: 2,
      shadowColor: ColorsManger.whiteColor,
      cornerRadius: 0,
      curveSize: 0,
      initialActiveIndex: mainCubit.index,
      height: Platform.isIOS ? 40.h : 50.h,
      items: [
        _buildTabItem(
          icon: ImagesConstants.home,
          activeIcon: ImagesConstants.home,
        ),
        _buildTabItem(
          icon: ImagesConstants.location,
          activeIcon: ImagesConstants.location,
        ),
        _buildTabItem(
          icon: ImagesConstants.calendar,
          activeIcon: ImagesConstants.calendar,
        ),
        _buildTabItem(
          icon: ImagesConstants.user,
          activeIcon: ImagesConstants.user,
        ),
      ],
      onTabNotify: (index) {
        mainCubit.changePage(index);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarBrightness:
              mainCubit.index == 3 ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              mainCubit.index == 3 ? Brightness.light : Brightness.dark,
        ));
        return true;
      },
      onTap: (int index) {
        mainCubit.changePage(index);
      },
    );
  }

  TabItem<dynamic> _buildTabItem({
    required String icon,
    String? title,
    bool isIconBlend = false,
    String? activeIcon,
    Color? color,
    bool? isCenter = false,
  }) {
    return TabItem(
      icon: _buildNavIcon(isCenter!, icon, color ?? ColorsManger.greyColor400),
      title: title,
      isIconBlend: isIconBlend,
      activeIcon:
          _buildNavIcon(isCenter, activeIcon, ColorsManger.greyColor600),
    );
  }

  CustomSvgImage _buildNavIcon(
      bool isCenter, String? activeIcon, Color? color) {
    return CustomSvgImage(
      imageName: activeIcon,
      height: 20.h,
      width: 20.h,
      color: color ?? ColorsManger.primaryColor,
    );
  }
}
