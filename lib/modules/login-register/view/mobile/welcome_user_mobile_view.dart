import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';

class WelcomeUserMobileView extends StatelessWidget {
  const WelcomeUserMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                buildHeader('Logout', () => Get.toNamed(Routes.LOGIN)),
                SizedBox(height: 44.h),
                _buildWelcomeText(
                    text: "Welcome Back Usman, 🤗",
                    subtitle: "Enter your password to Login"),
                SizedBox(height: 50.h),
                SvgPicture.asset(kSvgProfile),
                SizedBox(
                  height: 30.h,
                ),
                _buildInputFields(controller),
                SizedBox(height: 15.h),
                buildForgotPasswordText(
                    text: "Forgot Password",
                    gradient: "Recover",
                    ontap: () => Get.toNamed(Routes.FORGOT_PASSWORD)),
                SizedBox(height: 40.h),
                Center(
                    child: buildLoginButton(
                        text: 'Login', ontap: () => {Get.toNamed(Routes.BOTTOM_NAVIGATION)})),
                SizedBox(height: 40.h),
                _buildScannerButton(() {
                  CustomScandialog(context);
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildScannerButton(VoidCallback? onTap) {
  return customScanButton(Svgpath: kSvgFinger_Scan, ontap: onTap);
}

Widget _buildWelcomeText({required String text, required String subtitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: AppTextStyle.textStylexLarge
            .copyWith(fontFamily: FontsFamily.TsukimiBold),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        subtitle,
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          color: AppColors.customColor,
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
    ],
  );
}

Widget buildHeader(String text, VoidCallback? onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(kSvgAppLogo1),
      buildLoginText(
        text: text,
        ontap: onTap,
        color: AppColors.redColorShade2,
      ),
    ],
  );
}

Widget _buildInputFields(LoginController controller) {
  return buildCustomTextField(
    title: "Password",
    hintText: '',
    suffixIcon: kSvgShow,
    validator: (value) => value!.isNotEmpty ? null : 'Password cannot be empty',
    keyboardType: TextInputType.visiblePassword,
  );
}

Widget buildForgotPasswordText(
    {required String text, required String gradient, Function()? ontap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "${text}\t",
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          color: AppColors.greyColor100,
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
      GestureDetector(
        onTap: ontap,
        child: Text(
          gradient,
          style: AppTextStyle.textStyleSmallNormal.copyWith(
            color: AppColors.primaryColor,
            fontFamily: FontsFamily.OpenSansSemiBold,
          ),
        ),
      ),
    ],
  );
}
