import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';

class OtpRegMobileView extends StatelessWidget {
  const OtpRegMobileView({super.key});

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
                  'Login',(){},
                ),
                SizedBox(height: 44.h),
                buildWelcomeText(
                  text: "Verify your Phone Number",),
                SizedBox(height: 30.h),
                buildTransactionPinText(text: 'Enter OTP'),
                SizedBox(
                  height: 10.h,
                ),
                buildOTPFields(controller),
                SizedBox(height: 40.h),
                Center(child: buildLoginButton( text: 'Verify',ontap: ()=>{Get.toNamed(Routes.CREATE_USER)})),
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

Widget buildWelcomeText({
  required String text,
  String? firstText,
  String? secondText,
  String? thirdText,
  String? fourthText,
  String? fifthText,
  String? sixthText,
  String? Seventhtext,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: AppTextStyle.textStylexLarge
            .copyWith(fontFamily: FontsFamily.TsukimiBold),
      ),
      SizedBox(
        height: 10.h,
      ),
      _buildRichText(
        firstText: 'A 6 digit OTP has been sent to\n',
        secondText: '+2348065650633 ',
        thirdText: 'and ',
        fourthText: 'usmanndako@gmail.com ',
        fifthText: 'enter the code to continue.',
      ),
    ],
  );
}

Widget _buildRichText({
  required String firstText,
  required String secondText,
  required String thirdText,
  required String fourthText,
  required String fifthText,
}) {
  return RichText(
    text: TextSpan(
      style: AppTextStyle.textStyleSmallNormal
          .copyWith(fontFamily: FontsFamily.OpenSansRegular),
      // Default style for all text
      children: <TextSpan>[
        TextSpan(
            text: firstText, style: TextStyle(color: AppColors.customColor)),
        TextSpan(
            text: secondText, style: TextStyle(color: AppColors.primaryColor)),
        TextSpan(
            text: thirdText, style: TextStyle(color: AppColors.customColor)),
        TextSpan(
            text: fourthText, style: TextStyle(color: AppColors.primaryColor)),
        TextSpan(
            text: fifthText, style: TextStyle(color: AppColors.customColor)),
      ],
    ),
  );
}
