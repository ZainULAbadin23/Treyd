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


class DepositCryptoTransactionMobileView extends StatelessWidget {
  const DepositCryptoTransactionMobileView({super.key});

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
                buildHeaderText(text: 'Confirm Transaction'),
                SizedBox(
                  height: 30.h,
                ),
                _buildTransferBalance(),
                Center(child: Image.asset(kPngQRCODE,height: 230.h,width: 228.w,)),
                _buildWalletAddress(title: 'Wallet Address'),
                SizedBox(height: 20.h,),
                Obx(
                      () => Column(
                    children: controller.details.map((detail) {
                      // Use the reusable _buildDetailRow widget
                      return _buildDetailRow(
                        label: detail["label"] ?? "",
                        value: detail["value"] ?? "",
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: buildCustomColorButton(text: 'Done', ontap: () => {Get.toNamed(Routes.BOTTOM_NAVIGATION)})),
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget _buildWalletAddress({required String title}){
  return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(
    title,
    style: AppTextStyle.textStyleSmallNormal.copyWith(
        color: AppColors.greyColor600,
        fontFamily: FontsFamily.OpenSansRegular),
  ),
    SizedBox(height: 10.h,),
    Row(
      children: [
        Text(
          '48394u83uc483jjds884334',
          style: AppTextStyle.textStyleMediumNormal.copyWith(
              fontFamily: FontsFamily.OpenSansMedium),
        ),
        SizedBox(width: 8.w,),
        SvgPicture.asset(kSvgCopyIcon),
      ],
    ),]
  );
}

Widget _buildTransferBalance() {
  return Center(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightBlueColor,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 107.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            Text(
              'Amount to Transfer',
              style: AppTextStyle.textStyleSmallNormal.copyWith(
                  fontFamily: FontsFamily.OpenSansRegular,
                  color: AppColors.greyColor500),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '2,000.00 USDT',
              style: AppTextStyle.textStylexLarge.copyWith(
                fontSize: 24.sp,
                fontFamily: FontsFamily.TsukimiMedium,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '\₦600,000.00',
              style: AppTextStyle.textStyleMediumNormal.copyWith(
                  fontFamily: FontsFamily.OpenSansRegular,
                  color: AppColors.greyColor500),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildDetailRow({required String label, required String value}) {
  // Special handling for the "Coin" row with an icon
  if (label == "Coin") {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.textStyleSmallNormal.copyWith(
              color: AppColors.greyColor600,
              fontFamily: FontsFamily.OpenSansRegular),
        ),
        Spacer(),
        SvgPicture.asset(kSvgCryptoLogo),
        SizedBox(width: 8.w),
        Text(
          value,
          style: AppTextStyle.textStyleMediumNormal.copyWith(
              fontFamily: FontsFamily.OpenSansMedium),
        ),
      ],
    );
  }
  // Default layout for other rows
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.textStyleSmallNormal.copyWith(
              color: AppColors.greyColor600,
              fontFamily: FontsFamily.OpenSansRegular),
        ),
        Text(
          value,
          style: AppTextStyle.textStyleMediumNormal.copyWith(
              fontFamily: FontsFamily.OpenSansMedium),
        ),
      ],
    ),
  );
}
