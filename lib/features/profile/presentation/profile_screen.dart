import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/core/constants/images_constants.dart';
import 'package:gemini_comp/core/helper_widgets/custom_image_widget.dart';
import 'package:gemini_comp/core/helper_widgets/custom_text_widget.dart';
import 'package:gemini_comp/core/utils/extensions.dart';
import 'package:gemini_comp/core/utils/user_data.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles_manager.dart';
import '../../../core/utils/shared_prefs.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomText(
            "Profile",
            style: getSemiBoldStyle(
              fontSize: 20.sp,
              color: ColorsManger.greyColor700,
            ),
          ),
          verticalSpacing(25),
          ClipRRect(
            borderRadius: BorderRadius.circular(200.r),
            child: CustomSvgImage(
              imageName: ImagesConstants.user,
              height: 170.h,
              width: 170.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpacing(16),
          CustomText(
            UserData.instance.user.displayName ?? "",
            style: getBoldStyle(
              fontSize: 16.sp,
              color: ColorsManger.greyColor800,
            ),
          ),
          verticalSpacing(4),
          CustomText(
            UserData.instance.user.email ?? "",
            style: getRegularStyle(
              fontSize: 14.sp,
              color: ColorsManger.greyColor500,
            ),
          ),
          verticalSpacing(16.h),
          ProfileItem(
            icon: ImagesConstants.userEdit,
            title: "Edit Profile",
            onTap: () {},
          ),
          ProfileItem(
            icon: ImagesConstants.heart,
            title: "Favorites",
            onTap: () {},
          ),
          ProfileItem(
            icon: ImagesConstants.notification,
            title: "Notifications",
            onTap: () {},
          ),
          ProfileItem(
            icon: ImagesConstants.setting,
            title: "Settings",
            onTap: () {},
          ),
          ProfileItem(
            icon: ImagesConstants.messageQuestion,
            title: "Help and Support",
            onTap: () {},
          ),
          ProfileItem(
            icon: ImagesConstants.securitySafe,
            title: "Terms and Conditions",
            onTap: () {},
          ),
          ProfileItem(
            icon: ImagesConstants.logout,
            title: "Log Out",
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                SharedPreferencesService.removeData("isLoggedIn");
                context.pushReplacementNamed(Routes.login);
              });
            },
            withDivider: false,
            withTrailing: false,
          ),
        ],
      ),
    );
  }
}
