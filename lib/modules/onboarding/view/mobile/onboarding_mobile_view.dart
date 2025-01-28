import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/onboarding/controller/onboarding_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dot_indicator.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';

class OnboardingMobileView extends StatelessWidget {
  const OnboardingMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(children: [
              SizedBox(
                height: 50.h,
              ),
              buildSignINUPHeader(
                'Login',
                () => Get.toNamed(Routes.LOGIN),
              ),
              SizedBox(
                height: 70.h,
              ),
              Obx(() => _buildPage(controller)),
              SizedBox(
                height: 80.h,
              ),
              _buildNextButton(controller,text:"Start Treyding"),
              SizedBox(
                height: 30.h,
              ),
              buildLoginRegisterText(
                  text: "Already have an account?",
                  gradient: "Login",
                  ontap: () => Get.toNamed(Routes.LOGIN)),
            ]),
          );
        });
  }
}

Widget _buildNextButton(OnboardingController controller,
    {required String text}) {
  return Container(
    width: 226.w,
    child: CustomButton(
      onPressed: controller.nextPage,
      radius: 16,
      title: text,
      isTitleUpperCase: false,
    ),
  );
}

Widget _buildPage(OnboardingController controller) {
  final pageDetails = controller.getPageDetails();

  return Column(
    children: [
      SvgPicture.asset(pageDetails['image']),
      SizedBox(height: 45.h),
      Text(
        pageDetails['text'],
        style: AppTextStyle.textStyleLargeBold.copyWith(
          fontFamily: FontsFamily.TsukimiBold,
          fontSize: 32,
        ),
      ),
      SizedBox(height: 30.h),
      Text(
        pageDetails['description'],
        textAlign: TextAlign.center,
        style: AppTextStyle.textStyleMediumNormal.copyWith(
          color: AppColors.customColor,
          fontFamily: FontsFamily.OpenSansRegular,
          height: 1.45,
        ),
      ),
      SizedBox(height: 45.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          final dotSize = index == controller.isPage.value.index ? 25.0 : 10.0;
          return Dot(isActive: dotSize > 12, width: dotSize);
        }),
      ),
    ],
  );
}
