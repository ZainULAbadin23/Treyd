import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';

class ForgotPasswordMobileView extends StatelessWidget {
  const ForgotPasswordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                buildSignINUPHeader(
                  '',
                  () {},
                ),
                SizedBox(height: 44.h),
                buildWelcomeText(
                    text: "Forgot Password",
                    subtitle: "Enter your email/phone number to continue"),
                SizedBox(height: 30.h),
                _buildInputFields(controller),
                SizedBox(height: 40.h),
                Center(
                    child: buildLoginButton(
                        text: 'Get Code',
                        ontap: () => Get.toNamed(Routes.OTP))),
                SizedBox(height: 40.h),
                buildLoginRegisterText(
                    text: "Back to",
                    gradient: "Login",
                    ontap: () => Get.toNamed(Routes.LOGIN)),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildInputFields(LoginController controller) {
  return Column(
    children: [
      SizedBox(height: 20.h),
      buildDropDownTextField(
        controller,
        title: 'Phone Number',
        hintText: '+234',
        keyboardType: TextInputType.phone,
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
          style: AppTextStyle.textStyleSmallNormal.copyWith(
              fontFamily: FontsFamily.OpenSansRegular,
              color: AppColors.customColor),
          'Or'),
      SizedBox(
        height: 8.h,
      ),
      buildCustomTextField(
        title: "Email Address",
        hintText: 'Your email address',
        validator: (value) {
          return null;
        },
        keyboardType: TextInputType.emailAddress,
      ),
    ],
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
