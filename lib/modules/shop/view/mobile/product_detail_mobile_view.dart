import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/widgets/app_text_style.dart';
import 'package:treyd_crypto/core/widgets/custom_widgets.dart';
import 'package:treyd_crypto/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/carousel_slider.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dot_indicator.dart';
import '../../../../core/widgets/custom_svgicon_button.dart';
import '../../controller/shop_controller.dart';

class ProductDetailMobileView extends StatelessWidget {
  const ProductDetailMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      init: ShopController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                customIconButton(
                    svgIcon: kSvgArrowBackBlue,
                    ontap: () => {Get.back()},
                    color: AppColors.primaryColor.withOpacity(0.1)),
                SizedBox(
                  height: 5.h,
                ),
                customSlider(controller.sliderIndex, kPngLaptop),
                SizedBox(height: 40.h),
                _buildProductTitleDescription(
                    title: 'Mackbook Pro 2020',
                    specs: '256GB SSD, 16GB, VGA',
                    description:
                        'Apple MacBook Pro 13" M1 Chip 8GB 512GB 2020 Model. The Apple M1 chip redefines the 13-inch MacBook Pro. Featuring an 8-core CPU that flies through complex workflows in photography, coding, video editing, and more.',
                    description1:
                        'Incredible 8-core GPU that crushes graphics-intensive tasks and enables super-smooth gaming. ',
                    readMore: 'More details'),
                SizedBox(height: 20.h),
                _buildProductDetailRow(
                    BitText: '0.000000023BTC', DollarText: '\$1,200'),
                SizedBox(height: 40.h),
                _buildButtonsRow(),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget customSlider(RxInt sliderIndex, String image) {
  return Container(
    child: Column(
      children: [
        CarouselSlider(
            items: List.generate(3, (i) {
              return Image.asset(
                image,
                fit: BoxFit.cover,
              );
            }),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.9,
              viewportFraction: 1,
              disableCenter: true,
              onPageChanged: (index, reason) {
                sliderIndex.value = index;
              },
            )),
        SizedBox(
          height: 30.h,
        ),
        Obx(
          () => Container(
            width: 55.w,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final dotSize = sliderIndex.value == index ? 25.0 : 7.0;
                return Dot(isActive: dotSize > 12, width: dotSize);
              }),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildProductTitleDescription({
  required String title,
  required String specs,
  required String description,
  required String description1,
  required String readMore,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyle.textStyleLargeBold
            .copyWith(fontFamily: FontsFamily.OpenSansBold, fontSize: 20.sp),
      ),
      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            specs,
            style: AppTextStyle.textStyleMediumNormal.copyWith(
                fontFamily: FontsFamily.OpenSansRegular,
                color: AppColors.greyColor),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Gadgets',
              style: AppTextStyle.textStyleSmallNormal.copyWith(
                  fontFamily: FontsFamily.OpenSansRegular,
                  color: AppColors.whiteColor),
            ),
          )
        ],
      ),
      SizedBox(height: 15.h),
      Text(
        description,
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
      SizedBox(height: 20.h),
      Text(
        description1,
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
      Text(
        readMore,
        style: AppTextStyle.textStyleSmallBold.copyWith(
            fontFamily: FontsFamily.OpenSansMedium,
            color: AppColors.primaryColor),
      ),
    ],
  );
}

Widget _buildProductDetailRow(
    {required String BitText, required String DollarText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
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
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            BitText,
            style: AppTextStyle.textStyleLargeNormal.copyWith(
                fontFamily: FontsFamily.OpenSansMedium,
                fontSize: 20.sp,
                color: AppColors.primaryColor),
          ),
          SizedBox(height: 5.h),
          Text(
            DollarText,
            style: AppTextStyle.textStyleMediumNormal.copyWith(
                fontFamily: FontsFamily.OpenSansRegular,
                color: AppColors.greyColor),
          ),
        ],
      ),
    ],
  );
}

Widget _buildButtonsRow() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CustomButton(
          onPressed: () {Get.toNamed(Routes.BUY_NOW);},
          color: AppColors.primaryColor,
          radius: 16,
          padding: EdgeInsets.symmetric(vertical: 17.h),
          title: 'Buy Now',
          isTitleUpperCase: false,
        ),
      ),
      SizedBox(width: 12.w),
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
            kSvgHeart,
            color: AppColors.whiteColor,
          ),
        ),
      )
    ],
  );
}
