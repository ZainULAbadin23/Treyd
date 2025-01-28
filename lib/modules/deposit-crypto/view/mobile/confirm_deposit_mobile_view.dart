import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/transfer-crypto/controller/transfer_crypto_controller.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';

class ConfirmDepositMobileView extends StatelessWidget {
  const ConfirmDepositMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferCryptoController>(
      init: TransferCryptoController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                buildHeaderText(text: 'Deposit Crypto'),
                SizedBox(height: 30.h,),
                Center(
                  child: Container(
                    width: 105.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.customColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          kSvgCryptoLogo,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Tether",
                          style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                _buildTransferBalance(),
                SizedBox(height: 40.h,),
                _buildInputFields(controller,),
                SizedBox(height: 40.h,),
                Center(child: buildLoginButton(text: 'Get Address',ontap: ()=>{Get.toNamed(Routes.CRYPTO_DEPOSIT_TRANSACTION)})),
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget _buildTransferBalance(){
  return Column(
    children: [
      Text('Amount to Transfer',style: AppTextStyle.textStyleSmallNormal.copyWith(
          fontFamily: FontsFamily.OpenSansRegular,
          color: AppColors.greyColor500
      ),),
      SizedBox(height:8.h,),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('2,000.00',
            style: AppTextStyle.textStylexLarge.copyWith(
              fontSize:24.sp,fontFamily: FontsFamily.TsukimiMedium,
            ),),
          SizedBox(width: 10.w,),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text('USDT',
              style: AppTextStyle.textStylexLarge.copyWith(
                fontSize: 20.sp,fontFamily: FontsFamily.OpenSansRegular,
              ),),
          ),
        ],
      ),
      SizedBox(height:8.h,),
      Text('₦600,000.00',
        style: AppTextStyle.textStyleMediumNormal.copyWith(
            fontFamily: FontsFamily.OpenSansRegular,
            color: AppColors.greyColor500
        ),),
    ],
  );
}
Widget _buildInputFields(TransferCryptoController controller) {
  return Column(
    children: [
      buildCustomTextField1(
        title: "Network",
        hintText: "Select Network",
        keyboardType: TextInputType.text,
        suffixIcon: kSvgArrowDown, validator: (String? value) {
          return null;
        }, onTap: () {  },
      ),
      Divider(thickness: 0.5, color: AppColors.greyColor500,),
    ],
  );
}



