import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/utils/app_colors.dart';
import 'package:treyd_crypto/core/widgets/custom_svgicon_button.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/profile_controller.dart';

class AccountMobileView extends StatelessWidget {
  const AccountMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                _buildProfileSvgRow(),
                SizedBox(
                  height: 20.h,
                ),
                buildWelcomeText(
                    text: 'Hello,Johnson',
                    subtitle: 'Manage your account & Preferences'),
                SizedBox(
                  height: 30.h,
                ),
                buildProfileCard(
                  title: 'My Profile',
                  ontap: () {Get.toNamed(Routes.MY_PROFILE);},
                  description: 'Your profile and personal information',
                  ksvg: kSvgUserEdit,
                ),
                SizedBox(
                  height: 15.h,
                ),
                buildProfileCard(
                  title: 'Security',
                  ontap: () {Get.toNamed(Routes.SECURITY);},
                  description: 'Manage how you access your account',
                  ksvg: kSvgSecuritySafe,
                ),
                SizedBox(
                  height: 15.h,
                ),
                buildProfileCard(
                  title: 'Preferences',
                  ontap: () {Get.toNamed(Routes.PREFERENCES);},
                  description: 'Settings and configurations',
                  ksvg: kSvgSettings1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildProfileSvgRow() {
  return Container(
    width: 230.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          kSvgProfile,
          fit: BoxFit.cover,
          height: 108.h,
          width: 108.w,
        ),
        customIconButton(svgIcon: kSvgCamera, color: AppColors.greyColor500)
      ],
    ),
  );
}


