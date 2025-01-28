import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treyd_crypto/core/utils/app_colors.dart';
import '../../modules/shop/controller/shop_controller.dart';
import 'app_text_style.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final GestureTapCallback ontap;

  const ProductCard({Key? key, required this.product, required this.ontap, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            Image.asset(product.imageUrl,fit:BoxFit.cover,),
            SizedBox(height: 20.h),
            Divider(
              thickness: 0.5,
              color: AppColors.greyColor400,
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: AppTextStyle.textStyleSmallNormal.copyWith(
                        fontFamily: FontsFamily.OpenSansRegular,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      product.description,
                      style: AppTextStyle.textStyleXSmallNormal.copyWith(
                        color: AppColors.greyColor,
                        fontFamily: FontsFamily.OpenSansRegular,
                      ),
                    ),
                    Spacer(),
                    Text(
                      product.priceInBTC,
                      style: AppTextStyle.textStyleMediumNormal.copyWith(
                        color: AppColors.primaryColor,
                        fontFamily: FontsFamily.OpenSansMedium,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      product.priceInUSD,
                      style: AppTextStyle.textStyleSmallNormal.copyWith(
                        color: AppColors.greyColor,
                        fontFamily: FontsFamily.OpenSansRegular,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
