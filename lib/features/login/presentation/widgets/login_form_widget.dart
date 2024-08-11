import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/helper_widgets/custom_button_widget.dart';
import '../../../../core/helper_widgets/custom_image_widget.dart';
import '../../../../core/helper_widgets/custom_text_form_field.dart';
import '../../../../core/helper_widgets/toast_messages.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.primaryColor,
                  ),
                );
              },
            );
          },
          success: (loginResponse) {
            ToastMessages.showToastMessage(
              msg: "Login Successful",
              state: ToastStates.SUCCESS,
            );
            context.pushNamed(Routes.mainScreen);
          },
          error: (error) {
            context.pop();
            ToastMessages.showToastMessage(
              msg: error.toString(),
              state: ToastStates.ERROR,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                controller: cubit.emailController,
                onChanged: (value) {
                  cubit.validEmail(state.maybeWhen(
                    orElse: () => false,
                    validEmail: (isValid) {
                      return AppRegex.isEmailValid(value);
                    },
                  ));
                },
                prefixIcon: CustomSvgImage(
                  imageName: ImagesConstants.email,
                  width: 18.h,
                  height: 18.h,
                ),
                fillColor: ColorsManger.greyColor50,
                suffixIcon: CustomSvgImage(
                  imageName: ImagesConstants.checkCircle,
                  color: state.maybeWhen(
                    orElse: () => false,
                    validEmail: (value) => value,
                  )
                      ? ColorsManger.greenColor
                      : ColorsManger.greyColor200,
                ),
                hint: "Email",
                validator: (String? value) {
                  return Validators.validateEmail(value, context);
                },
                textInputType: TextInputType.emailAddress,
              ),
              verticalSpacing(20),
              CustomTextFormField(
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                prefixIcon: CustomSvgImage(
                  imageName: ImagesConstants.lock,
                  width: 18.h,
                  height: 18.h,
                ),
                controller: cubit.passwordController,
                fillColor: ColorsManger.greyColor50,
                isObscure: cubit.handleShowPassword(state),
                validator: (String? value) {
                  return Validators.validatePassword(value, context);
                },
                textInputType: TextInputType.visiblePassword,
                hint: "Password",
                suffixIcon: InkWell(
                  onTap: () {
                    cubit.toggleShowPassword(cubit.handleShowPassword(state));
                  },
                  child: Icon(
                    cubit.handleShowPassword(state)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20.sp,
                    color: ColorsManger.greyColor400,
                  ),
                ),
              ),
              verticalSpacing(23),
              CustomButtonWidget(
                text: "Sign In",
                color: ColorsManger.primaryColor,
                height: 44.h,
                radius: 25.r,
                onTap: () {
                  cubit.login();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
