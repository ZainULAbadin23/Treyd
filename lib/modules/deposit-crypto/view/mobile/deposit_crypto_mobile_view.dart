import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/deposit-crypto/controller/deposit_crypto_controller.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';

class DepositCryptoMobileView extends StatelessWidget {
  const DepositCryptoMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositCryptoController>(
      init: DepositCryptoController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                buildHeaderText(text: 'Deposit'),
                SizedBox(
                  height: 20.h,
                ),
                _buildCryptoSelection(),
                SizedBox(
                  height: 40.h,
                ),
                _buildInputFields(
                  controller,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                    child: buildLoginButton(
                        text: 'Continue',
                        ontap: () => {Get.toNamed(Routes.CONFIRM_DEPOSIT)})),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildCryptoSelection() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 70.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              'Crypto',
              style: AppTextStyle.textStyleMediumBold
                  .copyWith(fontFamily: FontsFamily.OpenSansSemiBold),
            ),
          ),
          Positioned(
            top: 45,
            child: Container(
              height: 8.h,
              width: 8.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ]),
        GestureDetector(
          onTap: (){Get.toNamed(Routes.DEPOSIT_FIAT);},
          child: Text(
            'Fiat',
            style: AppTextStyle.textStyleMediumBold.copyWith(
                color: AppColors.greyColor500,
                fontFamily: FontsFamily.OpenSansSemiBold),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInputFields(DepositCryptoController controller) {
  return Column(
    children: [
      buildCustomTextField1(
        title: "Select Crypto",
        onTap: () {
          Get.toNamed(Routes.SEARCH);
        },
        hintText: "Select Crypto",
        keyboardType: TextInputType.number,
        suffixIcon: kSvgArrowDown,
        validator: (String? value) {
          return null;
        },
      ),
      Divider(
        thickness: 0.5,
        color: AppColors.greyColor500,
      ),
      SizedBox(
        height: 20.h,
      ),
      _buildDropDownTextField(
        controller,
          title: 'Enter Amount',
          hintText: '',
          keyboardType: TextInputType.number),
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Divider(
              endIndent: 10,
              thickness: 0.5,
              color: AppColors.greyColor500,
            ),
          ),
          Expanded(
            flex: 3,
            child: Divider(
              thickness: 0.5,
              color: AppColors.greyColor500,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildDropDownTextField(
  DepositCryptoController controller, {
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
        // Country Code Dropdown
        Expanded(flex: 2,
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
          flex: 3,
          child: TextField(
            style: AppTextStyle.textStylexLarge.copyWith(
                fontFamily: FontsFamily.TsukimiMedium
            ),
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
      ],
    )
  ]);
}


