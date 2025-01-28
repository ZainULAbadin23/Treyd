import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import 'package:treyd_crypto/modules/login-register/controller/register_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';

class CreateUserMobileView extends StatelessWidget {
  const CreateUserMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                buildSignINUPHeader('Need Help?', () {}),
                SizedBox(height: 44.h),
                buildWelcomeText(
                    text: "Welcome Usman 🚀",
                    subtitle: "You need to secure your account."),
                SizedBox(height: 30.h),
                _buildInputFields(controller),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: _buildLoginButton(controller,
                        text: 'Continue',
                        ontap:() {
                          CustomScandialog(context,ontap: (){Get.toNamed(Routes.TRANSACTION_PIN);});
                        })),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildLoginButton(RegisterController controller,
    {required String text, Function()? ontap}) {
  return Container(
    width: 226.w,
    child: CustomButton(
      onPressed: ontap,
      radius: 16,
      title: text,
      isTitleUpperCase: false,
    ),
  );
}

Widget _buildInputFields(RegisterController controller) {
  return Column(
    children: [
      SizedBox(height: 20.h),
      buildCustomTextField(
        title: "Password",
        onchanged: (value) => controller.validatePassword(value),
        suffixIcon: kSvgShow,
        hintText: 'Create a strong password',
        validator: (value) {
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
      ),
      SizedBox(
        height: 10.h,
      ),
      Obx(() => _buildRichText(
            firstText: 'Must be more than ',
            secondText: '8 characters ',
            thirdText: 'and contain at least ',
            fourthText: 'one capital letter ',
            fifthText: ', one number ',
            sixthText: 'and ',
            seventhText: 'one special character',
            isValid: controller.isPasswordValid.value,
          )),
      SizedBox(
        height: 40.h,
      ),
      Obx(
        () => controller.isPasswordValid.value
            ? _buildBiometricCheck(controller)
            : SizedBox.shrink(),
      ),
    ],
  );
}

Widget _buildBiometricCheck(RegisterController controller) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: controller.isBiometricsEnabled.value,
            activeTrackColor: AppColors.primaryColor.withOpacity(0.4),
            inactiveTrackColor: AppColors.greyColor100,
            inactiveThumbColor: AppColors.greyColor500,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            onChanged: (value) => controller.toggleBiometrics(),
            activeColor: AppColors.primaryColor,
          ),
        ),
        Text(
          "Biometric Authentication",
          style: AppTextStyle.textStyleSmallNormal.copyWith(
            fontFamily: FontsFamily.OpenSansRegular,
            color: AppColors.blackColor,
          ),
        ),
      ],
    ),
    Text(
      "Allow authentication with device biometrics.",
      style: AppTextStyle.textStyleXSmallNormal
          .copyWith(color: AppColors.greyColor500,
      fontFamily: FontsFamily.OpenSansRegular),
    ),
  ]);
}

Widget _buildRichText({
  required String firstText,
  required String secondText,
  required String thirdText,
  required String fourthText,
  required String fifthText,
  required String sixthText,
  required String seventhText,
  required bool isValid,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isValid)
        Icon(
          Icons.check_circle,
          color: AppColors.greenColor1,
          size: 20,
        ),
      Expanded(
        child: RichText(
          text: TextSpan(
            style: AppTextStyle.textStyleXSmallNormal
                .copyWith(fontFamily: FontsFamily.OpenSansRegular),
            children: <TextSpan>[
              TextSpan(
                text: firstText,
                style: TextStyle(color: AppColors.greyColor500),
              ),
              TextSpan(
                text: secondText,
                style: TextStyle(
                    color: isValid
                        ? AppColors.greenColor1
                        : AppColors.greyColor300),
              ),
              TextSpan(
                text: thirdText,
                style: TextStyle(color: AppColors.greyColor500),
              ),
              TextSpan(
                text: fourthText,
                style: TextStyle(
                    color: isValid
                        ? AppColors.greenColor1
                        : AppColors.greyColor300),
              ),
              TextSpan(
                text: fifthText,
                style: TextStyle(
                    color: isValid
                        ? AppColors.greenColor1
                        : AppColors.greyColor300),
              ),
              TextSpan(
                text: sixthText,
                style: TextStyle(color: AppColors.greyColor500),
              ),
              TextSpan(
                text: seventhText,
                style: TextStyle(
                    color: isValid
                        ? AppColors.greenColor1
                        : AppColors.greyColor300),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
