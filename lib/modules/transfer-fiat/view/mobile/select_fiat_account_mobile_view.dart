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

class SelectFiatAccountMobileView extends StatelessWidget {
  const SelectFiatAccountMobileView({super.key});

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
                buildHeaderText(text: 'Transfer Fiat'),
                SizedBox(
                  height: 30.h,
                ),
                _buildTransferBalance(),
                SizedBox(
                  height: 20.h,
                ),
                _buildSelectAccount(),
                SizedBox(
                  height: 40.h,
                ),
                custombuildVerticalScroll(
                  controller.AccountCards,
                  (index) {
                    final card = controller
                        .AccountCards[index]; // Access the card at index
                    return _buildAccountCards(
                      index,
                      controller.AccountCards,
                      name: card["name"] as String,
                      icon: card["icon"] as String,
                      changeValue: card["changeValue"] as String,
                      custName: card["custName"] as String,
                      color: card["color"] as Color,
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                    child: buildLoginButton(
                        text: 'Continue',
                        ontap: () => {Get.toNamed(Routes.FIAT_TRANSACTION)})),
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

Widget _buildSelectAccount() {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'Select Account',
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
            onTap: () {
              // Use the current context from the widget tree
              addNewVehicleBottomSheet(Get.context!, () {
                Get.offAllNamed(Routes.TRANSFER_CRYPTO);
              });
            },
            child: Text(
              'New Account',
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

Widget _buildAccountCards(
  int index,
  List<dynamic> menu, {
  required String name,
  required String icon,
  required String changeValue,
  required Color color,
  required String custName,
}) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 84.h,
          width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.whiteColor1,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: color,
                    child: Image.asset(
                      icon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    name,
                    style: AppTextStyle.textStyleSmallBold.copyWith(
                      fontFamily: FontsFamily.OpenSansSemiBold,
                    ),
                  ),
                ],
              ),
              // Right Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    changeValue,
                    style: AppTextStyle.textStyleSmallBold.copyWith(
                      color: AppColors.greyColor,
                      fontFamily: FontsFamily.OpenSansRegular,
                    ),
                  ),
                  Spacer(),
                  Text(
                    custName,
                    style: AppTextStyle.textStyleSmallBold.copyWith(
                      color: AppColors.greyColor300,
                      fontFamily: FontsFamily.OpenSansRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
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
                    customAppbarWithCloseIcon(title: 'Add New Account'),
                    SizedBox(height: 20.h),
                    buildHorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add a new account number to your details",
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: AppColors.greyColor500,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Obx(
                            () => CustomDropdown(
                              enableSearch: false,
                              hintText: controller.dropdownText.value,
                              isSelectedIndex: controller.isSelectedIndex.value,
                              titleText: 'Bank',
                              dropdownList: controller.vehiclesList,
                              backgroundColor: AppColors.whiteColor,
                              onSelected: (value) {
                                controller.isSelectedIndex.value =
                                    value.id!.toInt();
                                controller.dropdownText.value =
                                    value.name.toString();
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField1(
                            title: 'Account Number',
                            hintText: "Enter your 10 digit account number",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    buildLoginButton(
                        text: 'Add Account',
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
