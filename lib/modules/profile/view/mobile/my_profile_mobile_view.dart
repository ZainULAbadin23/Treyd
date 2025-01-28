import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/profile_controller.dart';

class MyProfileMobileView extends StatelessWidget {
  const MyProfileMobileView({super.key});

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
                buildHeaderText(text: 'My Profile'),
                 SizedBox(height: 40.h,),
                _buildProfileTextFields(controller),
                SizedBox(height: 30.h,),
                Center(child: buildLoginButton(text: 'Update',ontap: (){Get.toNamed(Routes.ACCOUNT);}))
              ],
            ),
          ),
        );
      },
    );
  }
}


Widget _buildProfileTextFields(AccountController controller){
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
      _buildDropDownTextField(controller,title: 'Phone Number', hintText: '+234', keyboardType: TextInputType.phone,
      ),
    ],
  );
}


Widget _buildDropDownTextField(
    AccountController controller, {
      required String title,
      required String hintText,
      required TextInputType keyboardType,
    }) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      title,
      style: AppTextStyle.textStyleXSmallNormal.copyWith(
        color: AppColors.greyColor300,
        fontFamily: FontsFamily.OpenSansRegular,
      ),
    ),
    SizedBox(height: 8),
    Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: controller.countryCode.value,
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SvgPicture.asset(kSvgArrowDown),
            ),
            underline: SizedBox(),
            items: [
              DropdownMenuItem(
                value: "+234",
                child: SvgPicture.asset(kSvgFlag),
              ),
              DropdownMenuItem(
                value: "+1",
                child: SvgPicture.asset(kSvgFlag),
              ),
              DropdownMenuItem(
                value: "+44",
                child: SvgPicture.asset(kSvgFlag),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                controller.updateCountryCode(value);
              }
            },
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyle.textStyleSmallNormal.copyWith(
                    color: AppColors.greyColor500,
                    fontFamily: FontsFamily.OpenSansRegular),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                controller.phoneNumber.value = value;
              },
            ),
          ),
        ),
      ],
    )
  ]);
}
