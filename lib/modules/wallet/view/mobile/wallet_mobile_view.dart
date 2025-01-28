import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/widgets/custom_cryptoCard.dart';
import 'package:treyd_crypto/modules/wallet/controller/wallet_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_cryptocard_detail.dart';
import '../../../../core/widgets/custom_svgicon_button.dart';
import '../../../../core/widgets/custom_vertical_scroll.dart';
import '../../../../core/widgets/custom_widgets.dart';

class WalletMobileView extends StatelessWidget {
  const WalletMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                buildLargeHeaderText(title: 'My Wallet'),
                SizedBox(height: 30.h),
                buildHomeContainer(title: 'My Wallet', color: AppColors.blueGrey),
                SizedBox(height: 20.h),
                _buildHeadingtext(text: 'Transaction History'),
                SizedBox(
                  height: 20.h,
                ),
                custombuildVerticalScroll(
                  controller.cryptoCards,
                      (index) {
                    final card = controller.cryptoCards[index]; // Access the card at index
                    return customBuildMenuItem(
                      index,
                      controller.cryptoCards,
                      name: card["name"] as String,
                      icon: card["icon"] as String,
                      price: card["price"] as double,
                      percentageChange: card["percentageChange"] as double,
                      changeValue: card["changeValue"] as double,
                      amount: card["amount"] as double,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildHeadingtext({required String text}) {
  return Row(
    children: [
      Text(
        text,
        style: AppTextStyle.textStyleMediumBold
            .copyWith(fontFamily: FontsFamily.OpenSansSemiBold),
      ),
      Spacer(),
      customIconButton(svgIcon: kSvgSettings, color: AppColors.whiteColor1),
      SizedBox(width: 5.w),
      customIconButton(
          svgIcon: kSvgFilter, color: AppColors.primaryColor),
    ],
  );
}







