import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({super.key});

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
                buildSignINUPHeader('Sign Up',() => Get.toNamed(Routes.REGISTER),),
                SizedBox(height: 44.h),
                buildWelcomeText(
                    text: "Welcome Back 🤗", subtitle: "Login to your account"),
                SizedBox(height: 30.h),
                _buildInputFields(controller),
                SizedBox(height: 15.h),
                buildForgotPasswordText(
                    text: "Forgot Password",
                    gradient: "Recover",
                    ontap: () => Get.toNamed(Routes.FORGOT_PASSWORD)),
                SizedBox(height: 40.h),
                Center(child: buildLoginButton( text: 'Login',ontap: ()=>{Get.toNamed(Routes.BOTTOM_NAVIGATION)})),
                SizedBox(height: 40.h),
                buildLoginRegisterText(
                    text: "Don’t have an account?",
                    gradient: "Sign up",
                    ontap: () => Get.toNamed(Routes.REGISTER)),
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
      SizedBox(height: 15.h,),
      buildCustomTextField(
        title: "Password",
        hintText: '',
        suffixIcon: kSvgShow,
        validator: (value) =>
            value!.isNotEmpty ? null : 'Password cannot be empty',
        keyboardType: TextInputType.visiblePassword,
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
