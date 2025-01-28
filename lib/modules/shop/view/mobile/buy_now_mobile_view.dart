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

class BuyNowMobileView extends StatelessWidget {
  const BuyNowMobileView({super.key});

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
                SizedBox(
                  height: 10.h,
                ),
                buildHeaderText(text: 'Buy Now'),
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
                  height: 50.h,
                ),
                _buildButtonsRow(),
                SizedBox(
                  height: 20.h,
                ),
                buildBuyNowCard(
                  kpng: kPngLaptop,
                  name: 'Macbook Pro 2021',
                  description: '256GB SSD, 16GB, VGA...',
                  priceInBTC: '0.000000043BTC',
                  priceInUSD: '\$1,200',
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: buildLoginButton(
                        text: 'Pay Now',
                        ontap: () => {Get.toNamed(Routes.CONFIRM_ORDER)})),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildCryptoSelection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            'Pay with Crypto',
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
      GestureDetector(
        onTap: () {
          Get.toNamed(Routes.TRANSFER_FIAT);
        },
        child: Text(
          'Pay with Fiat',
          style: AppTextStyle.textStyleMediumBold.copyWith(
              color: AppColors.greyColor500,
              fontFamily: FontsFamily.OpenSansSemiBold),
        ),
      ),
    ],
  );
}

Widget _buildTransferBalance() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '0.00000438',
            style: AppTextStyle.textStylexLLarge.copyWith(
              fontSize: 32.sp,
              fontFamily: FontsFamily.TsukimiMedium,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              'BTC',
              style: AppTextStyle.textStylexLarge.copyWith(
                fontSize: 20.sp,
                fontFamily: FontsFamily.OpenSansMedium,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 8.h,
      ),
      Text(
        '\$9,500.00',
        style: AppTextStyle.textStyleMediumNormal.copyWith(
            fontFamily: FontsFamily.OpenSansRegular,
            color: AppColors.greyColor500),
      ),
    ],
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
                  kSvgBitcoinLogo,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "BTC",
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

Widget buildBuyNowCard({
  required String kpng,
  String? ksvg,
  required String name,
  required String description,
  required String priceInBTC,
  required String priceInUSD,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width:10.w,),
          Image.asset(
            kPngLaptop,
            height:36.h,
            width: 69.w,
            fit: BoxFit.cover,
          ),
          VerticalDivider(
            thickness: 0.5,
            color: AppColors.greyColor400,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,vertical: 15.h
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTextStyle.textStyleSmallNormal.copyWith(
                          fontFamily: FontsFamily.OpenSansRegular,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        description,
                        style: AppTextStyle.textStyleXSmallNormal.copyWith(
                          color: AppColors.greyColor,
                          fontFamily: FontsFamily.OpenSansRegular,
                        ),
                      ),
                      Spacer(),
                      Text(
                        priceInBTC,
                        style: AppTextStyle.textStyleMediumNormal.copyWith(
                          color: AppColors.primaryColor,
                          fontFamily: FontsFamily.OpenSansMedium,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        ksvg??'',
                        fit: BoxFit.cover,
                      ),
                      Spacer(),
                      Text(
                        priceInUSD,
                        style: AppTextStyle.textStyleSmallNormal.copyWith(
                          color: AppColors.greyColor,
                          fontFamily: FontsFamily.OpenSansRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildButtonsRow() {
  return Center(
    child: Container(width: 200.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 52.h,
              width: 52.w,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                kSvgMinus,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Text('1',style: AppTextStyle.textStylexLarge.copyWith(
            fontSize: 24.sp,fontFamily: FontsFamily.OpenSansMedium
          ),),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 52.h,
              width: 52.w,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                kSvgPlus,
                color: AppColors.whiteColor,
              ),
            ),
          )
        ],
      ),
    ),
  );
}