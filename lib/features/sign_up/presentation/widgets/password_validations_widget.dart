import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_widgets/custom_text_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/font_manager.dart';
import '../../../../core/utils/spacing.dart';

class PasswordValidationsWidget extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidationsWidget({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowercase),
        verticalSpacing(2),
        buildValidationRow('At least 1 uppercase letter', hasUppercase),
        verticalSpacing(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpacing(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpacing(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return hasValidated
        ? Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 2.5,
                  backgroundColor: ColorsManger.greyColor400,
                ),
                horizontalSpacing(6),
                CustomText(
                  text,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeightManager.regular,
                    color: hasValidated
                        ? ColorsManger.greyColor400
                        : ColorsManger.greyColor100,
                    decorationColor: Colors.green,
                    decorationThickness: 1.5,
                    decoration:
                        hasValidated ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
