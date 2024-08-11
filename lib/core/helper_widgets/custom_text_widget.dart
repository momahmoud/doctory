import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/font_styles.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final bool? underline;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextStyle? style;
  final TextOverflow? overflow;

  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.overflow,
    this.fontSize,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.underline = false,
    this.maxLines,
    this.fontFamily,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      style: style ??
          TextStyle(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize ?? 22.sp,
            color: color ?? Colors.black,
            fontFamily: fontFamily ?? FontStyles.fontFamily,
            decoration:
                underline! ? TextDecoration.underline : TextDecoration.none,
            fontStyle: fontStyle ?? FontStyle.normal,
          ),
    );
  }
}
