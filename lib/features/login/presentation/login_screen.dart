import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/images_constants.dart';
import '../../../core/helper_widgets/custom_text_widget.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/auth_header_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/or_login_widget.dart';
import 'widgets/social_login_btn_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                verticalSpacing(30),
                const AuthHeaderWidget(),
                verticalSpacing(32),
                const LoginFormWidget(),
                verticalSpacing(23),
                const OrLoginWidget(),
                verticalSpacing(23),
                const SocialLoginBtnWidget(
                  text: "Continue with Facebook",
                  imageName: ImagesConstants.facebook,
                ),
                verticalSpacing(16),
                const SocialLoginBtnWidget(
                  text: "Continue with Google",
                  imageName: ImagesConstants.google,
                ),
                verticalSpacing(23),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.forgotPassword);
                  },
                  child: CustomText(
                    "Forgot password?",
                    style: getMediumStyle(
                      color: ColorsManger.blueColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                verticalSpacing(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      "Don’t have an account?",
                      style: getRegularStyle(
                        color: ColorsManger.greyColor500,
                        fontSize: 14.sp,
                      ),
                    ),
                    horizontalSpacing(2),
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.register);
                      },
                      child: CustomText(
                        "Sign Up",
                        style: getMediumStyle(
                          color: ColorsManger.blueColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
