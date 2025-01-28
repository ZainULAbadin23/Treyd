import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';

class TransactionPinMobileView extends StatelessWidget {
  const TransactionPinMobileView({super.key});

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
                buildSignINUPHeader('Need Help?', () {}),
                SizedBox(height: 44.h),
                buildWelcomeText(
                    text: "One more thing, Usman 🚀",
                    subtitle:
                        "One last thing, create a secured transaction PIN"),
                SizedBox(height: 30.h),
                buildTransactionPinText(text: 'Create a 4 Digit Transaction PIN'),
                SizedBox(
                  height: 20.h,
                ),
                _buildTransactionFields(controller),
                SizedBox(height: 20.h,),
                _buildxSmallText(text: "Your 4 digit PIN will be used to authorize all your transactions on Treyd."),
                SizedBox(height: 40.h,),
                Center(
                    child: _buildLoginButton(controller,
                        text: 'All Done!',
                        ontap: () => Get.toNamed(Routes.LOGIN))),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget _buildxSmallText({required String text}){
return Text(
  text,style:AppTextStyle.textStyleXSmallNormal.copyWith(
  fontFamily: FontsFamily.OpenSansRegular,
  color: AppColors.greyColor500,
),
);
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

Widget _buildTransactionFields(LoginController controller) {
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
