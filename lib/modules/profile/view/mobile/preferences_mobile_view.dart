import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/widgets/app_text_style.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/profile_controller.dart';

class PreferencesMobileView extends StatelessWidget {
  const PreferencesMobileView({super.key});

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
                buildHeaderText(text: 'Preferences'),
                SizedBox(height: 40.h,),
                buildPreferenceTitleText(title: 'Theme'),
                SizedBox(height: 25.h,),
                buildCustomPreferenceSwitch(value: controller.isDarkMode,
                    onchanged: (value) {
                      controller.toggleDarkMode();
                    }, controller, title: 'Dark Mode', subTitle: 'Use dark mode theme'),
                SizedBox(height: 40.h,),
                buildPreferenceTitleText(title: 'Notifications'),
                SizedBox(height: 25.h,),
                buildCustomPreferenceSwitch(value: controller.isEmailEnabled,
                    onchanged: (value) {
                      controller.toggleEmailNotifications();
                    },controller, title: 'Email',color: AppColors.blackColor, subTitle: 'Get notifications via email'),
                SizedBox(height: 20.h,),
                buildCustomPreferenceSwitch(value: controller.isSMSEnabled,
                    onchanged: (value) {
                      controller.toggleSMSNotifications();
                    },controller, title: 'SMS', subTitle: 'Get notifications via SMS (Charges may apply)'),
                SizedBox(height: 40.h,),
                buildPreferenceTitleText(title: 'Security'),
                SizedBox(height: 25.h,),
                buildCustomPreferenceSwitch(value: controller.is2FAEnabled,
                    onchanged: (value) {
                      controller.toggle2FA();
                    },controller, title: '2FA',color: AppColors.blackColor, subTitle: 'Use 2FA for authorizing transactions'),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildPreferenceTitleText({required String title}){
  return Text(title,style: AppTextStyle.textStyleMediumNormal.copyWith(
      fontFamily: FontsFamily.OpenSansMedium
  ),);
}

Widget buildCustomPreferenceSwitch(AccountController controller,{Color? color,required String title,required String subTitle, required bool value, ValueChanged<bool>? onchanged}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [ Obx(() =>
          Container(
            width: 35.w,
            child: Transform.scale(
              scale: 0.7,
              child: Switch(
                value:value,
                onChanged:onchanged,
              inactiveThumbColor: AppColors.greyColor500,
                trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                inactiveTrackColor: AppColors.greyColor200,
                activeColor: AppColors.primaryColor, // Adjust the color to look disabled
              ),
            ),
          ),),
          SizedBox(width: 20.w,),
          Text(title,style: AppTextStyle.textStyleSmallNormal.copyWith(
            color:color ?? AppColors.greyColor500,
            fontFamily: FontsFamily.OpenSansRegular
          ),),
        ],
      ),
      Text(subTitle,style: AppTextStyle.textStyleXSmallNormal.copyWith(
          color:AppColors.greyColor500,
          fontFamily: FontsFamily.OpenSansRegular
      ),),
    ],
  );
}



