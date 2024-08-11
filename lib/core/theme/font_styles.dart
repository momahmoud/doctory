import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class FontStyles {
  static const String fontFamily = 'Inter';

  static TextStyle font24W700Black = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.blackColor,
  );
  static TextStyle font32W700Blue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w900,
    color: ColorsManger.primaryColor,
  );
  static TextStyle font24W700Blue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.primaryColor,
  );

  static TextStyle font20W700Black = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font16W700Black = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black);

  static TextStyle customFontStyle(
          double fontSize, FontWeight fontWeight, Color color) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
}
