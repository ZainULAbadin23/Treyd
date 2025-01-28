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

class TransferCryptoMobileView extends StatelessWidget {
  const TransferCryptoMobileView({super.key});

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
                buildHeaderText(text: 'Transfer'),
                SizedBox(height: 20.h,),
                _buildCryptoSelection(),
                SizedBox(height: 30.h,),
                _buildTransferDetails(),
                SizedBox(height: 30.h,),
                _buildTransferBalance(),
                SizedBox(height: 40.h,),
                _buildInputFields(controller,),
                Divider(thickness: 0.5, color: AppColors.greyColor500,),
                SizedBox(height: 30.h,),
                Center(child: buildLoginButton(text: 'Continue',ontap: ()=>{Get.toNamed(Routes.CONFIRM_CRYPTO)})),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildCryptoSelection(){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 70.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(alignment: Alignment.bottomCenter,
          children: [Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text('Crypto',
            style: AppTextStyle.textStyleMediumBold.copyWith(
              fontFamily: FontsFamily.OpenSansSemiBold
            ),),
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
          ]
        ),
        GestureDetector(onTap: (){Get.toNamed(Routes.TRANSFER_FIAT);},
          child: Text('Fiat',
            style: AppTextStyle.textStyleMediumBold.copyWith(
              color: AppColors.greyColor500,
                fontFamily: FontsFamily.OpenSansSemiBold
            ),),
        ),
      ],
    ),
  );
}
Widget _buildTransferBalance(){
  return Column(
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('8,540.00',
          style: AppTextStyle.textStylexLLarge.copyWith(
            fontSize: 32.sp,fontFamily: FontsFamily.TsukimiMedium,
          ),),
          SizedBox(width: 10.w,),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text('USDT',
              style: AppTextStyle.textStylexLarge.copyWith(
                fontSize: 20.sp,fontFamily: FontsFamily.OpenSansMedium,
              ),),
          ),
        ],
      ),
      SizedBox(height:8.h,),
      Text('\$9,500.00',
        style: AppTextStyle.textStyleMediumNormal.copyWith(
          fontFamily: FontsFamily.OpenSansRegular,
          color: AppColors.greyColor500
        ),),
    ],
  );
}
Widget _buildTransferDetails(){
  return Column(
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Wallet Balance',style: AppTextStyle.textStyleSmallNormal.copyWith(
              fontFamily: FontsFamily.OpenSansRegular,
              color: AppColors.greyColor500
          ),),
          Container(
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
                  "USDT",
                  style: AppTextStyle.textStyleSmallNormal.copyWith(
                      fontFamily: FontsFamily.OpenSansRegular),
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


Widget _buildInputFields(TransferCryptoController controller) {
  return Column(
    children: [
      buildCustomTextField1(
        title: "Enter Amount",
        hintText: "Amount",
        keyboardType: TextInputType.number,
        suffixIcon: kSvgMax, validator: (String? value) {
          return null;
        }, onTap: () {  },
      ),
    ],
  );
}





