import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/modules/transfer-fiat/controller/add_account_controller.dart';
import 'package:treyd_crypto/modules/transfer-fiat/controller/transfer_fiat_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_addAccount_appbar.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_vertical_scroll.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';

class SelectDepositFiatCardMobileView extends StatelessWidget {
  const SelectDepositFiatCardMobileView({super.key});

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
                buildHeaderText(text: 'Deposit Fiat'),
                SizedBox(
                  height: 30.h,
                ),
                _buildTransferBalance(),
                SizedBox(
                  height: 20.h,
                ),
                buildSelectAccount(title: 'Select Card', subtitle: 'New Card',ontap:() {
                  // Use the current context from the widget tree
                  addNewVehicleBottomSheet(Get.context!, () {
                    Get.offAllNamed(Routes.SELECT_DEPOSIT_FIAT);
                  });
                },),
                SizedBox(
                  height: 40.h,
                ),
                Image.asset(kPngCard,),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                    child: buildLoginButton(
                        text: 'Continue',
                        ontap: () => {Get.toNamed(Routes.FIAT_DEPOSIT_TRANSACTION)})),
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
  );
}



void addNewVehicleBottomSheet(BuildContext context, Function() onTap) {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // Removes default rounded corners
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.whiteColor1,
    builder: (context) {
      return GetBuilder<AddAccountController>(
        init: AddAccountController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color: Theme.of(context).listTileTheme.tileColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    customAppbarWithCloseIcon(title: 'Add New Card'),
                    SizedBox(height: 20.h),
                    buildHorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add a new card to your details",
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: AppColors.greyColor500,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField1(
                            title: 'Card Number',
                            hintText: "Enter your card number",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField1(
                                  title: 'Expiry Date',
                                  hintText: "MM/YY",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Expanded(
                                child: CustomTextField1(
                                  title: 'Security Code',
                                  hintText: "",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    buildLoginButton(
                        text: 'Continue',
                        ontap: () {
                          Get.back();
                        }),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
