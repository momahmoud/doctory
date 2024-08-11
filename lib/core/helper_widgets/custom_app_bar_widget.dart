import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/utils/extensions.dart';

import '../constants/images_constants.dart';
import '../theme/colors.dart';
import 'custom_image_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? title;
  final bool? isTitle;
  final double elevation;
  final Color shadowColor;
  final Color? leadingColor;
  final bool? isLeading;
  final bool? isHome;
  final bool? isCenter;
  final Function()? onTap;
  final Widget? actionIcon;
  final Color? color;
  final bool? isBorder;

  const CustomAppBar({
    this.title,
    super.key,
    this.isTitle = true,
    this.elevation = 0.0,
    this.shadowColor = ColorsManger.greyColor500,
    this.isLeading = true,
    this.isCenter = false,
    this.isHome = false,
    this.onTap,
    this.actionIcon,
    this.color,
    this.leadingColor,
    this.isBorder = true,
  }) : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarOpacity: 1,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorsManger.whiteColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      toolbarHeight: 50.h,
      backgroundColor: color ?? ColorsManger.whiteColor,
      elevation: elevation,
      shadowColor: shadowColor,
      centerTitle: isCenter,
      titleSpacing: 6.w,
      leadingWidth: 40.w,
      actions: [actionIcon ?? const SizedBox()],
      title: isTitle! ? title : null,
      leading: isLeading!
          ? Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: InkWell(
                splashColor: Colors.white,
                highlightColor: Colors.white,
                onTap: () {
                  context.pop();
                },
                child: CustomSvgImage(
                  imageName: ImagesConstants.arrowLeft,
                  height: 24.h,
                  width: 24.h,
                  color: ColorsManger.greyColor700,
                ),
              ),
            )
          : null,
    );
  }
}
