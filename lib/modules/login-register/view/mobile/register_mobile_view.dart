import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';

class RegisterMobileView extends StatelessWidget {
  const RegisterMobileView({super.key});

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
                  'Login',
                  () => Get.toNamed(Routes.LOGIN),
                ),
                SizedBox(height: 44.h),
                buildWelcomeText(
                    text: "Create your free account",
                    subtitle:
                        "To get started with Treyd, create your account."),
                SizedBox(height: 30.h),
                _buildInputFields(controller),
                SizedBox(height: 40.h),
                Center(
                    child: buildLoginButton(
                        text: 'Create Account', ontap: () => {Get.toNamed(Routes.OTP_REG)})),
                SizedBox(height: 40.h),
                buildLoginRegisterText(
                    text: "Already have an account?",
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
      buildCustomTextField(
        title: "First Name",
        hintText: 'Your first name',
        validator: (value) =>
            value!.isNotEmpty ? null : 'Password cannot be empty',
        keyboardType: TextInputType.text,
      ),
      SizedBox(
        height: 15.h,
      ),
      buildCustomTextField(
          title: "Last Name",
          hintText: 'Your last name',
          validator: (value) =>
              value!.isNotEmpty ? null : 'Password cannot be empty',
          keyboardType: TextInputType.text),
      SizedBox(
        height: 15.h,
      ),
      buildCustomTextField(
          title: "Email Address",
          hintText: 'Your email address',
          validator: (value) =>
              value!.isNotEmpty ? null : 'Password cannot be empty',
          keyboardType: TextInputType.emailAddress),
      SizedBox(
        height: 15.h,
      ),
      buildDropDownTextField(
        controller,
        title: 'Phone Number',
        hintText: '+234',
        keyboardType: TextInputType.phone,
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
