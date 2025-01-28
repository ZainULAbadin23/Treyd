import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_addAccount_appbar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/profile_controller.dart';

class SecurityMobileView extends StatelessWidget {
  const SecurityMobileView({super.key});

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
                buildHeaderText(text: 'Security'),
                SizedBox(
                  height: 50.h,
                ),
                buildProfileCard(
                  title: 'Password',
                  ontap:() {
                    // Use the current context from the widget tree
                    changePasswordBottomSheet(Get.context!, () {
                      Get.offAllNamed(Routes.SECURITY);
                    });
                  },
                  description: 'Change account password',
                  ksvg: kSvgLock,
                ),
                SizedBox(
                  height: 15.h,
                ),
                buildProfileCard(
                  title: 'Transaction PIN',
                  ontap:() {
                    // Use the current context from the widget tree
                    changeTransactionPinBottomSheet(Get.context!, () {
                      Get.offAllNamed(Routes.SECURITY);
                    });
                  },
                  description: 'Change Transaction PIN',
                  ksvg: kSvgLock1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void changePasswordBottomSheet(BuildContext context, Function() onTap) {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // Removes default rounded corners
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.whiteColor1,
    builder: (context) {
      return GetBuilder<AccountController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color: Theme.of(context).listTileTheme.tileColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    customAppbarWithCloseIcon(title: 'Change Password'),
                    SizedBox(height: 20.h),
                    buildHorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Update your account password",
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: AppColors.greyColor500,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          buildCustomTextField(
                            title: "Old Password",
                            suffixIcon: kSvgShow,
                            hintText: 'Enter your old password',
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 20.h),
                          buildCustomTextField(
                            title: "New Password",
                            suffixIcon: kSvgShow,
                            hintText: 'Enter your new password',
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          buildRichText(
                            firstText: 'Must be more than ',
                            secondText: '8 characters ',
                            thirdText: 'and contain at least ',
                            fourthText: 'one capital letter ',
                            fifthText: ', one number ',
                            sixthText: 'and ',
                            seventhText: 'one special character',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    buildLoginButton(
                        text: 'Save',
                        ontap: () {
                          Get.back();
                        }),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}



void changeTransactionPinBottomSheet(BuildContext context, Function() onTap) {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // Removes default rounded corners
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.whiteColor1,
    builder: (context) {
      return GetBuilder<AccountController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color: Theme.of(context).listTileTheme.tileColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    customAppbarWithCloseIcon(title: 'Change Transaction PIN'),
                    SizedBox(height: 20.h),
                    buildHorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Update your Transaction PIN",
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: AppColors.greyColor500,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          buildTransactionPinText(text: 'Enter old PIN'),
                          SizedBox(height: 10.h),
                          _buildTransactionFields(controller),
                          SizedBox(height: 10.h),
                          buildTransactionPinText(text: 'Enter old PIN'),
                          SizedBox(height: 10.h),
                          _buildTransactionFields(controller),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    buildLoginButton(
                        text: 'Save',
                        ontap: () {
                          Get.back();
                        }),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}


Widget _buildTransactionFields(AccountController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.center,
        child: Pinput(
          keyboardType: TextInputType.phone,
          obscureText: true,
          autofocus: true,
          length: 4,
          defaultPinTheme: Themes.defaultPinTheme,
        ),
      ),
    ],
  );
}

class Themes {
  static final defaultPinTheme = PinTheme(
      height: 87.h,
      width: 64.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      textStyle: AppTextStyle.textStyleMediumNormal.copyWith(
          fontFamily: FontsFamily.OpenSansMedium,
          fontSize: 40,
          color: AppColors.customColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor2,
      ));
  static final submittedPinTheme = PinTheme(
      height: 87.h,
      width: 64.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      textStyle: AppTextStyle.textStyleMediumNormal
          .copyWith(fontFamily: FontsFamily.OpenSansMedium, fontSize: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor2,
      ));
}