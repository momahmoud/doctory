import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/features/login/presentation/widgets/or_login_widget.dart';

import '../../../core/theme/colors.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'widgets/sign_up_form_widget.dart';
import 'widgets/sign_up_top_section.dart';
import 'widgets/already_have_account_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                const SignUpTopSection(),
                verticalSpacing(32),
                const SignUpFormWidget(),
                verticalSpacing(35),
                const OrLoginWidget(),
                verticalSpacing(35),
                const AlreadyHaveAccountWidget(),
                verticalSpacing(20),
                const SignUpBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
