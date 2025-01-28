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

class ChangePassMobileView extends StatelessWidget {
  const ChangePassMobileView({super.key});

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
                buildSignINUPHeader('', () {}),
                SizedBox(height: 44.h),
                buildWelcomeText(
                    text: "Set a new Password",
                    subtitle: "Set a new password for your account"),
                SizedBox(height: 30.h),
                _buildInputFields(controller),
                SizedBox(height: 40.h),
                Center(
                    child: _buildLoginButton(controller,
                        text: 'Save',
                        ontap: () => Get.toNamed(Routes.WELCOME_BACK_USER))),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildLoginButton(LoginController controller,
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

Widget _buildInputFields(LoginController controller) {
  return Column(
    children: [
      SizedBox(height: 20.h),
      buildCustomTextField(
        title: "New Password",
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
      buildRichText(
        firstText: 'Must be more than ',
        secondText: '8 characters ',
        thirdText: 'and contain at least ',
        fourthText: 'one capital letter ',
        fifthText: ', one number ',
        sixthText: 'and ',
        seventhText: 'one special character',
      ),
      SizedBox(
        height: 20.h,
      ),
      buildCustomTextField(
        title: "Confirm Password",
        hintText: '',
        suffixIcon: kSvgShow,
        validator: (value) {
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
      ),
    ],
  );
}


