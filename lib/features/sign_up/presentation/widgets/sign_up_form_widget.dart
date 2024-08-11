import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/strings_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/spacing.dart';
import '../../cubit/sign_up_cubit.dart';
import '../../data/models/sign_up_request_body.dart';
import 'password_validations_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool isObscure = true;
  bool isRememberMe = false;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    final passwordController = context.read<SignUpCubit>().passwordController;
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Form(
      key: signUpCubit.formKey,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            prefixIcon: CustomSvgImage(
              imageName: ImagesConstants.user,
              width: 18.h,
              height: 18.h,
              color: ColorsManger.greyColor400,
            ),
            fillColor: ColorsManger.greyColor50,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            controller: signUpCubit.nameController,
            hint: StringsConstants.username,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter your name";
              }
              return null;
            },
            textInputType: TextInputType.name,
          ),
          verticalSpacing(16),
          CustomTextFormField(
            prefixIcon: CustomSvgImage(
              imageName: ImagesConstants.email,
              width: 18.h,
              height: 18.h,
            ),
            fillColor: ColorsManger.greyColor50,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            controller: signUpCubit.emailController,
            hint: StringsConstants.email,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return StringsConstants.enterEmail;
              } else if (!AppRegex.isEmailValid(value)) {
                return StringsConstants.enterValidEmail;
              }
              return null;
            },
            textInputType: TextInputType.emailAddress,
          ),
          verticalSpacing(16),
          CustomTextFormField(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            controller: signUpCubit.passwordController,
            isObscure: isObscure,
            prefixIcon: CustomSvgImage(
              imageName: ImagesConstants.lock,
              width: 18.h,
              height: 18.h,
            ),
            fillColor: ColorsManger.greyColor50,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                size: 20.sp,
                color: ColorsManger.greyColor400,
              ),
            ),
            hint: StringsConstants.password,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return StringsConstants.enterPassword;
              } else if (!AppRegex.isPasswordValid(value)) {}

              return null;
            },
            textInputType: TextInputType.emailAddress,
          ),
          PasswordValidationsWidget(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpacing(20),
          CustomButtonWidget(
            text: "Create Account",
            color: ColorsManger.primaryColor,
            height: 44.h,
            radius: 25.r,
            onTap: () => signUp(signUpCubit),
          ),
        ],
      ),
    );
  }

  void signUp(SignUpCubit signUpCubit) {
    if (signUpCubit.formKey.currentState!.validate()) {
      signUpCubit.register(
        SignUpRequestBody(
          email: signUpCubit.emailController.text,
          password: signUpCubit.passwordController.text,
          phone: signUpCubit.phoneNumberController.text,
          name: signUpCubit.nameController.text,
        ),
      );
    }
  }
}
