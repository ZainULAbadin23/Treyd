import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_addAccount_appbar.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/confirm_order_controller.dart';

class ConfirmOrderMobileView extends StatelessWidget {
  const ConfirmOrderMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmOrderController>(
      init: ConfirmOrderController(),
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
                buildHeaderText(text: 'Confirm Order'),
                SizedBox(
                  height: 30.h,
                ),
                _buildTransferBalance(),
                SizedBox(
                  height: 20.h,
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
                    child: buildCustomColorButton(
                  text: 'Confirm Order',
                  ontap: () {
                    // Use the current context from the widget tree
                    addNewVehicleBottomSheet(Get.context!, () {
                      Get.offAllNamed(Routes.CONFIRM_ORDER);
                    });
                  },
                )),
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
              'Amount to Pay',
              style: AppTextStyle.textStyleSmallNormal.copyWith(
                  fontFamily: FontsFamily.OpenSansRegular,
                  color: AppColors.greyColor500),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '0.0000.485BTC',
              style: AppTextStyle.textStylexLarge.copyWith(
                fontSize: 24.sp,
                fontFamily: FontsFamily.TsukimiMedium,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '\$2,540.00',
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

void addNewVehicleBottomSheet(BuildContext context, Function() onTap) {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.whiteColor1,
    builder: (context) {
      return GetBuilder<ConfirmOrderController>(
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
                    customAppbarWithCloseIcon(title: 'Enter Transaction PIN'),
                    SizedBox(height: 20.h),
                    buildHorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter your 4 Digit Transaction PIN to confirm Transaction",
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: AppColors.greyColor500,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          buildTransactionPinText(text: 'Transaction PIN'),
                          SizedBox(height: 10.h),
                          _buildTransactionFields(controller),
                          SizedBox(height: 40.h),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 5.h,
                            ),
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              if (index == 9) {
                                // Empty button for alignment
                                return SizedBox();
                              } else if (index == 11) {
                                // Backspace button
                                return GestureDetector(
                                  onTap: () {
                                    if (controller.pin.value.isNotEmpty) {
                                      controller.updatePin(controller.pin.value
                                          .substring(0,
                                              controller.pin.value.length - 1));
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Icon(Icons.backspace,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: AppColors.greyColor500,
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                // Numeric button
                                final number =
                                    index == 10 ? "0" : "${index + 1}";
                                return GestureDetector(
                                  onTap: () {
                                    // Append digit to the PIN
                                    if (controller.pin.value.length < 4) {
                                      controller.updatePin(
                                          controller.pin.value + number);
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            number,
                                            style: TextStyle(
                                              fontSize: 28.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: AppColors.greyColor500,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    buildCustomColorButton(
                        text: 'Confirm',
                        ontap: () =>
                            {Get.back(), CustomConfirmdialog(context)}),
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

Widget _buildTransactionFields(ConfirmOrderController controller) {
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
          onChanged: (value) {
            // Update the PIN state as the user types
            controller.updatePin(value);
          },
          defaultPinTheme: Themes.defaultPinTheme,
        ),
      ),
    ],
  );
}

class Themes {
  static final defaultPinTheme = PinTheme(
      height: 87.h,
      width: 64.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      textStyle: AppTextStyle.textStyleMediumNormal.copyWith(
          fontFamily: FontsFamily.OpenSansMedium,
          fontSize: 40,
          color: AppColors.customColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor2,
      ));
  static final submittedPinTheme = PinTheme(
      height: 87.h,
      width: 64.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      textStyle: AppTextStyle.textStyleMediumNormal
          .copyWith(fontFamily: FontsFamily.OpenSansMedium, fontSize: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor2,
      ));
}
