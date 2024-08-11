import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text_widget.dart';
import '../utils/spacing.dart';

import '../theme/colors.dart';
import '../theme/styles_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool? isObscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? lines;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure,
    this.fillColor,
    this.contentPadding,
    this.controller,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          CustomText(
            label,
            style: getMediumStyle(
              color: ColorsManger.greyColor500,
              fontSize: 14.sp,
            ),
          ),
        if (label != null) verticalSpacing(8),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          cursorColor: ColorsManger.greyColor500,
          cursorHeight: 18.h,
          cursorWidth: 3.w,
          cursorRadius: Radius.circular(4.r),
          style: getRegularStyle(
            color: ColorsManger.greyColor500,
            fontSize: 14.sp,
          ),
          keyboardType: textInputType ?? TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: isObscure ?? false,
          obscuringCharacter: '*',
          minLines: lines ?? 1,
          maxLines: lines ?? 1,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? ColorsManger.greyColor100,
            isDense: true,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: prefixIcon,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: suffixIcon,
            ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 100, maxWidth: 100),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 50, maxWidth: 50),
            border: borderStyle(ColorsManger.greyColor100),
            enabledBorder: borderStyle(ColorsManger.greyColor100),
            focusedBorder: borderStyle(ColorsManger.greyColor100),
            errorBorder: borderStyle(ColorsManger.redColor),
            focusedErrorBorder: borderStyle(ColorsManger.redColor),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            errorStyle: getRegularStyle(
              color: ColorsManger.redColor,
              fontSize: 12.sp,
            ),
            hintText: hint ?? "",
            hintStyle: getRegularStyle(
              color: ColorsManger.greyColor400,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder borderStyle(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
}
