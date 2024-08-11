// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../theme/colors.dart';
// import '../theme/styles_manager.dart';
// import '../utils/spacing.dart';
// import 'custom_text_widget.dart';

// class CustomPhoneFieldWidget extends StatelessWidget {
//   final String? label;
//   final String? hint;
//   final bool? isObscure;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final String? Function(String?)? validator;
//   final TextInputType? textInputType;
//   final Function(PhoneNumber)? onInputChanged;
//   final Function(String)? onFieldSubmitted;
//   const CustomPhoneFieldWidget({
//     super.key,
//     this.label,
//     this.hint,
//     this.isObscure,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.validator,
//     this.textInputType,
//     this.onInputChanged,
//     this.onFieldSubmitted,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         if (label != null)
//           CustomText(
//             label!.tr(context),
//             style: getMediumStyle(
//               color: ColorsManger.grayColor900,
//               fontSize: 14.sp,
//             ),
//           ),
//         verticalSpacing(8),
//         InternationalPhoneNumberInput(
//           validator: validator,
//           onInputChanged: (value) {
//             if (onInputChanged != null) {
//               onInputChanged?.call(value);
//             }
//           },
//           onInputValidated: (bool value) {},
//           countries: const ["EG"],
//           spaceBetweenSelectorAndTextField: 8,
//           inputBorder: borderStyle(Colors.black),
//           selectorConfig: const SelectorConfig(
//             selectorType: PhoneInputSelectorType.DROPDOWN,
//             leadingPadding: 0,
//             setSelectorButtonAsPrefixIcon: false,
//             trailingSpace: false,
//           ),
//           ignoreBlank: false,
//           autoValidateMode: AutovalidateMode.disabled,
//           selectorTextStyle: getMediumStyle(
//             color: ColorsManger.primaryColor900,
//             fontSize: 14.sp,
//           ),
//           formatInput: true,
//           keyboardType: const TextInputType.numberWithOptions(
//             signed: true,
//             decimal: true,
//           ),
//           inputDecoration: InputDecoration(
//             prefixIcon: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: prefixIcon,
//             ),
//             suffixIcon: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: suffixIcon,
//             ),
//             suffixIconConstraints:
//                 const BoxConstraints(maxHeight: 50, maxWidth: 50),
//             prefixIconConstraints:
//                 const BoxConstraints(maxHeight: 50, maxWidth: 50),
//             border: borderStyle(ColorsManger.textGrey0),
//             enabledBorder: borderStyle(ColorsManger.textGrey0),
//             focusedBorder: borderStyle(ColorsManger.primaryColor900),
//             errorBorder: borderStyle(ColorsManger.redColor),
//             focusedErrorBorder: borderStyle(ColorsManger.redColor),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 16.w,
//               vertical: 8.h,
//             ),
//             errorStyle: getRegularStyle(
//               color: ColorsManger.redColor,
//               fontSize: 12.sp,
//             ),
//             hintText: hint ?? "",
//             hintStyle: getRegularStyle(
//               color: ColorsManger.textGrey3,
//               fontSize: 14.sp,
//             ),
//           ),
//           onSaved: (PhoneNumber number) {},
//         ),
//       ],
//     );
//   }

//   OutlineInputBorder borderStyle(Color color) => OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.r),
//         borderSide: BorderSide(
//           color: color,
//           width: 1,
//         ),
//       );
// }
