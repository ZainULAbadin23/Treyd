import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/transfer-fiat/controller/transfer_fiat_controller.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';

class TransferFiatMobileView extends StatelessWidget {
  const TransferFiatMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferFiatController>(
      init: TransferFiatController(),
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
                buildHeaderText(text: 'Transfer'),
                SizedBox(
                  height: 20.h,
                ),
                _buildCryptoSelection(),
                SizedBox(
                  height: 30.h,
                ),
                _buildTransferDetails(),
                SizedBox(
                  height: 30.h,
                ),
                _buildTransferBalance(),
                SizedBox(
                  height: 40.h,
                ),
                _buildDropDownTextField(controller,
                    title: 'Enter Amount',
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
                SizedBox(
                  height: 30.h,
                ),
                Center(
                    child: buildLoginButton(
                        text: 'Continue',
                        ontap: () => {Get.toNamed(Routes.SELECT_FIAT)})),
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
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.TRANSFER_CRYPTO);
          },
          child: Text(
            'Crypto',
            style: AppTextStyle.textStyleMediumBold.copyWith(
                color: AppColors.greyColor500,
                fontFamily: FontsFamily.OpenSansSemiBold),
          ),
        ),
        Stack(alignment: Alignment.bottomCenter, children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              'Fiat',
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
      ],
    ),
  );
}

Widget _buildTransferBalance() {
  return Center(
    child: Column(
      children: [
        Text(
          '\₦ 6,600,540.00',
          style: AppTextStyle.textStylexLLarge.copyWith(
            fontSize: 32.sp,
            fontFamily: FontsFamily.TsukimiMedium,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          '\$8,540.00',
          style: AppTextStyle.textStyleMediumNormal.copyWith(
              fontFamily: FontsFamily.OpenSansRegular,
              color: AppColors.greyColor500),
        ),
      ],
    ),
  );
}

Widget _buildTransferDetails() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wallet Balance',
            style: AppTextStyle.textStyleSmallNormal.copyWith(
                fontFamily: FontsFamily.OpenSansRegular,
                color: AppColors.greyColor500),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.customColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  kSvgNGNFlag,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "NGN",
                  style: AppTextStyle.textStyleSmallNormal
                      .copyWith(fontFamily: FontsFamily.OpenSansRegular),
                ),
                SizedBox(
                  width: 8.w,
                ),
                SvgPicture.asset(
                  kSvgArrowDown,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildDropDownTextField(
  TransferFiatController controller, {
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
                child: SvgPicture.asset(kSvgNGNFlag),
              ),
              DropdownMenuItem(
                value: "+1",
                child: SvgPicture.asset(kSvgFlag),
              ),
              DropdownMenuItem(
                value: "+44",
                child: SvgPicture.asset(kSvgNGNFlag),
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
