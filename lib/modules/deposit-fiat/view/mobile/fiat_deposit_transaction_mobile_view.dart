import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/transfer-fiat/controller/fiat_transaction_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../controller/fiat_deposit_transaction_controller.dart';

class FiatDepositTransactionMobileView extends StatelessWidget {
  const FiatDepositTransactionMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiatDepositTransactionController>(
      init: FiatDepositTransactionController(),
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
                SizedBox(
                  height: 40.h,
                ),
                Obx(
                      () => Column(
                    children: controller.details.map((detail) {
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
                    child: buildLoginButton(
                        text: 'Confirm',
                        ontap: () => {CustomConfirmdialog(context)})),
              ],
            ),
          ),
        );
      },
    );
  }
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
              '₦600,000.00',
              style: AppTextStyle.textStylexLarge.copyWith(
                fontSize: 24.sp,
                fontFamily: FontsFamily.TsukimiMedium,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '\$1,540.00',
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

Widget buildLoginButton({required String text, Function()? ontap}) {
  return Container(
    width: 226.w,
    child: CustomButton(
      onPressed: ontap,
      color: AppColors.greenColor1,
      radius: 16,
      title: text,
      isTitleUpperCase: false,
    ),
  );
}

Widget _buildDetailRow({required String label, required String value}) {
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
          style: AppTextStyle.textStyleMediumNormal
              .copyWith(fontFamily: FontsFamily.OpenSansMedium),
        ),
      ],
    ),
  );
}
