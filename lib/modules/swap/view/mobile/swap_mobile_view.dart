import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/swap_controller.dart';

class SwapMobileView extends StatelessWidget {
  const SwapMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwapController>(
      init: SwapController(),
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
                buildHeaderText(text: 'Swap Crypto'),
                SizedBox(
                  height: 45.h,
                ),
                 _buildCryptoConvertDropdown(controller, title: 'From'),

                SizedBox(
                  height: 20.h,
                ),
                Center(child: SvgPicture.asset(kSvgConvert)),
                SizedBox(
                  height: 10.h,
                ),
                 _buildCryptoConvertDropdown(controller, title: 'To'),
                SizedBox(
                  height: 10.h,
                ),
                SvgPicture.asset(kSvgTradeSummary1),
                SizedBox(
                  height: 30.h,
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
                        ontap: () =>
                            {Get.toNamed(Routes.SWAP_CONFIRM)})),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildInputFields(SwapController controller) {
  return Column(
    children: [
      _buildDropDownTextField(controller,
          title: 'Enter Amount to Swap',
          hintText: '0.00',
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

Widget _buildCryptoConvertDropdown(SwapController controller,
    {required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyle.textStyleXSmallNormal.copyWith(
          color: AppColors.greyColor300,
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
  CustomDropdown(controller: controller,),
      Divider(
        thickness: 0.5,
        color: AppColors.greyColor500,
      ),
    ],
  );
}

Widget _buildDropDownTextField(
  controller, {
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
        Expanded(
          flex: 2,
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
                child: SvgPicture.asset(kSvgCryptoLogo),
              ),
              DropdownMenuItem(
                value: "+1",
                child: SvgPicture.asset(kSvgCryptoLogo),
              ),
              DropdownMenuItem(
                value: "+44",
                child: SvgPicture.asset(kSvgCryptoLogo),
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
            keyboardType: TextInputType.number,
            style: AppTextStyle.textStylexLarge
                .copyWith(fontFamily: FontsFamily.TsukimiMedium),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyle.textStylexLarge.copyWith(
                  color: AppColors.greyColor500,
                  fontFamily: FontsFamily.TsukimiMedium),
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



class CustomDropdown extends StatelessWidget {
  final controller;
  const CustomDropdown({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>DropdownButton2<String>(
      value: controller.countryCode.value,
      iconStyleData: IconStyleData(
        icon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SvgPicture.asset(kSvgArrowDown),
        ),
      ),
      underline: SizedBox(),
      isExpanded: true,
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              offset: Offset(0, 4), // Shadow offset
              blurRadius: 6, // Shadow blur radius
              spreadRadius: 2, // Shadow spread radius
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        offset: Offset(0, 6),
      ),
      items: [
        DropdownMenuItem(
          value: "+234",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(kSvgCryptoLogo),
              SizedBox(width: 8.w),
              Text("Tether"),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "+1",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(kSvgBitcoinLogo),
              SizedBox(width: 8.w),
              Text("Bitcoin"),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "+44",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(kSvgCryptoLogo),
              SizedBox(width: 8.w),
              Text("Etherium"),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          controller.updateCountryCode(value);
        }
      },
    ));
  }
}
