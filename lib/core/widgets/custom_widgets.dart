import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/login-register/controller/login_controller.dart';
import '../../routes/app_routes.dart';
import '../assets/constants.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';
import 'custom_actionButton.dart';
import 'custom_button.dart';
import 'custom_cryptoCard.dart';
import 'custom_svgicon_button.dart';
import 'custom_text_field.dart';

class Themes {
  static final defaultPinTheme = PinTheme(
      height: 72.h,
      width: 48.w,
      textStyle: AppTextStyle.textStyleMediumNormal.copyWith(
          fontFamily: FontsFamily.OpenSansMedium,
          fontSize: 32,
          color: AppColors.customColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor2,
      ));
  static final submittedPinTheme = PinTheme(
      height: 72.h,
      width: 48.w,
      textStyle: AppTextStyle.textStyleMediumNormal
          .copyWith(fontFamily: FontsFamily.OpenSansMedium, fontSize: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor2,
      ));
}

Widget buildSignINUPHeader(String text, VoidCallback? onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(kSvgAppLogo1),
      buildLoginText(
        text: text,
        ontap: onTap,
        color: AppColors.primaryColor,
      ),
    ],
  );
}

Widget buildHeader({Function()? ontap, required String title}) {
  return buildHorizontalPadding(
    child: Row(
      children: [
        GestureDetector(
          onTap: ontap,
          child: SvgPicture.asset(
            kSvgCross,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(
          title,
          style: AppTextStyle.textStyleLargeNormal
              .copyWith(fontFamily: FontsFamily.OpenSansMedium),
        )
      ],
    ),
  );
}

Widget buildWelcomeText({required String text, required String subtitle}) {
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
      Text(
        subtitle,
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          color: AppColors.customColor,
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
    ],
  );
}

Widget buildLoginButton({required String text, Function()? ontap}) {
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

Widget buildCustomTextField({
  required String title,
  required String hintText,
  required FormFieldValidator<String> validator,
  required TextInputType keyboardType,
  String? prefixIcon,
  String? suffixIcon,
  ValueChanged<String>? onchanged,
  controller,
}) {
  return CustomTextField1(
    validator: validator,
    hintText: hintText,
    title: title,
    onChanged: onchanged,
    textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
    prefixIcon: prefixIcon != null
        ? SvgPicture.asset(prefixIcon, fit: BoxFit.scaleDown)
        : null,
    suffixIcon: suffixIcon != null
        ? SvgPicture.asset(suffixIcon, fit: BoxFit.scaleDown)
        : null,
  );
}

Widget buildHeaderText({required String text}) {
  return Text(
    text,
    style: AppTextStyle.textStyleLargeBold.copyWith(
      fontSize: 24.sp,
      fontFamily: FontsFamily.TsukimiBold,
    ),
  );
}

Widget buildRichText({
  required String firstText,
  required String secondText,
  required String thirdText,
  required String fourthText,
  required String fifthText,
  required String sixthText,
  required String seventhText,
}) {
  return RichText(
    text: TextSpan(
      style: AppTextStyle.textStyleXSmallNormal
          .copyWith(fontFamily: FontsFamily.OpenSansRegular),
      // Default style for all text
      children: <TextSpan>[
        TextSpan(
            text: firstText, style: TextStyle(color: AppColors.greyColor500)),
        TextSpan(
            text: secondText, style: TextStyle(color: AppColors.greyColor300)),
        TextSpan(
            text: thirdText, style: TextStyle(color: AppColors.greyColor500)),
        TextSpan(
            text: fourthText, style: TextStyle(color: AppColors.greyColor300)),
        TextSpan(
            text: fifthText, style: TextStyle(color: AppColors.greyColor300)),
        TextSpan(
            text: sixthText, style: TextStyle(color: AppColors.greyColor500)),
        TextSpan(
            text: seventhText, style: TextStyle(color: AppColors.greyColor300)),
      ],
    ),
  );
}

Widget buildTransactionFields() {
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

Widget buildProfileCard({
  required String ksvg,
  required String title,
  required String description,
  Function()? ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 92.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            customIconButton(svgIcon: ksvg, color: AppColors.greyColor300),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: AppTextStyle.textStyleSmallNormal.copyWith(
                      fontFamily: FontsFamily.OpenSansRegular,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Text(description,
                    style: AppTextStyle.textStyleXSmallNormal.copyWith(
                      fontFamily: FontsFamily.OpenSansRegular,
                      color: AppColors.greyColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildDropDownTextField(
  LoginController controller, {
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

Widget buildTransactionPinText({
  required String text,
  Color? color,
}) {
  return Text(
      style: AppTextStyle.textStyleSmallNormal.copyWith(
          fontFamily: FontsFamily.OpenSansRegular,
          color: color ?? AppColors.customColor),
      text);
}

Widget buildRecommendedCard() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: CryptoCard(
            img: kPngCryptoLogo,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: CryptoCard(
            img: kPngCryptoLogo1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: CryptoCard(
            img: kPngCryptoLogo,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: CryptoCard(
            img: kPngCryptoLogo1,
          ),
        ),
      ],
    ),
  );
}

Widget buildLargeHeaderText({required String title}) {
  return Text(
    title,
    style: AppTextStyle.textStylexLLarge.copyWith(
      fontSize: 44.sp,
      fontFamily: FontsFamily.TsukimiBold,
    ),
  );
}

Widget buildCustomColorButton({
  required String text,
  Function()? ontap,
  Color? color,
}) {
  return Container(
    width: 226.w,
    child: CustomButton(
      onPressed: ontap,
      color: AppColors.greenColor1 ?? color,
      radius: 16,
      title: text,
      isTitleUpperCase: false,
    ),
  );
}

CustomScandialog(BuildContext context,{Function()? ontap}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildHorizontalPadding(
                child: Container(
                  height: 278.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(0)),
                  child: buildHorizontalPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        GestureDetector(onTap: ontap,
                            child: SvgPicture.asset(kSvgFinger_Scan2)),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Touch the Finger Print Sensor",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: AppColors.greyColor300),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        _buildDialogueCancelButton(text: "Cancel"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

Widget _buildDialogueCancelButton({required String text}) {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Text(
      text,
      style: AppTextStyle.textStyleSmallNormal.copyWith(
        fontFamily: FontsFamily.OpenSansSemiBold,
        color: AppColors.redColorDark,
      ),
    ),
  );
}

Widget buildCustomTextField1({
  required String title,
  required String hintText,
  required FormFieldValidator<String> validator,
  required TextInputType keyboardType,
  String? suffixIcon,
  controller,
  required Null Function() onTap,
}) {
  return CustomTextField(
    validator: validator,
    title: title,
    onTap: onTap,
    hintText: hintText,
    textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
    suffixIcon: suffixIcon != null
        ? SvgPicture.asset(suffixIcon, fit: BoxFit.scaleDown)
        : null,
  );
}

Widget buildOTPFields(LoginController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.center,
        child: Pinput(
          keyboardType: TextInputType.phone,
          autofocus: true,
          length: 6,
          defaultPinTheme: Themes.defaultPinTheme,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Resend Code in ",
            style: AppTextStyle.textStyleSmallNormal.copyWith(
              fontFamily: FontsFamily.OpenSansRegular,
              color: AppColors.customColor,
            ),
          ),
          Text(
            "60 secs",
            style: AppTextStyle.textStyleSmallNormal.copyWith(
              fontFamily: FontsFamily.OpenSansSemiBold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildSelectAccount(
    {required String title,
    required String subtitle,
    required Function()? ontap}) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            title,
            style: AppTextStyle.textStyleSmallNormal.copyWith(
                fontFamily: FontsFamily.OpenSansRegular,
                color: AppColors.greyColor500),
          ),
          Spacer(),
          SvgPicture.asset(kSvgPlus),
          SizedBox(
            width: 8.w,
          ),
          GestureDetector(
            onTap: ontap,
            child: Text(
              subtitle,
              style: AppTextStyle.textStyleSmallNormal.copyWith(
                fontFamily: FontsFamily.OpenSansMedium,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

CustomConfirmdialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildHorizontalPadding(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 378.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      SvgPicture.asset(kSvgCheck1),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Successful",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStylexLLarge.copyWith(
                            fontFamily: FontsFamily.TsukimiMedium,
                            fontSize: 32.sp,
                            color: AppColors.greyColor300),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Your transaction was completed successfully.",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleSmallNormal.copyWith(
                            fontFamily: FontsFamily.OpenSansRegular,
                            color: AppColors.greyColor600),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      buildCustomColorButton(
                          text: 'Confirm',
                          ontap: () => {Get.toNamed(Routes.BOTTOM_NAVIGATION)}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      });
}

Widget buildHomeContainer({
  required String title,
  required Color color,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.textStyleSmallNormal.copyWith(
                color: AppColors.whiteColor,
                fontFamily: FontsFamily.OpenSansRegular,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "USD",
                    style: AppTextStyle.textStyleSmallNormal.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: FontsFamily.OpenSansRegular),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SvgPicture.asset(
                    kSvgArrowDown,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "\$8,540.00",
          style: AppTextStyle.textStylexLLarge.copyWith(
            fontSize: 32.sp,
            color: AppColors.whiteColor,
            height: 1.5,
            fontFamily: FontsFamily.TsukimiMedium,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionButton(
              icon: kSvgMoneySend,
              label: "Transfer",
              ontap: () {
                Get.toNamed(Routes.TRANSFER_CRYPTO);
              },
            ),
            ActionButton(
              icon: kSvgMoneyReceive,
              label: "Deposit",
              ontap: () {
                Get.toNamed(Routes.DEPOSIT_CRYPTO);
              },
            ),
            ActionButton(
              icon: kSvgBitcoin_convert,
              label: "Swap",
              ontap: () {
                Get.toNamed(Routes.SWAP);
              },
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    ),
  );
}

Widget buildHorizontalPadding({required Widget child}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: child,
  );
}
