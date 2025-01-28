import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/carousel_slider.dart';
import '../../../../core/widgets/custom_addAccount_appbar.dart';
import '../../../../core/widgets/custom_dot_indicator.dart';
import '../../../../core/widgets/custom_product_card.dart';
import '../../../../core/widgets/custom_svgicon_button.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/shop_controller.dart';
import 'buy_now_mobile_view.dart';

class ShopMobileView extends StatelessWidget {
  const ShopMobileView({super.key});

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
                _buildHeader(),
                SizedBox(height: 20.h),
                customSlider(controller.sliderIndex, kPngSliderImage),
                SizedBox(height: 20.h),
                _buildShopRow(controller),
                SizedBox(height: 20.h),
                _buildShopButtons(),
                _buildCustomProductCard(controller),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        'Your Treyd Shop',
        style: AppTextStyle.textStyleLargeBold
            .copyWith(fontSize: 24.sp, fontFamily: FontsFamily.TsukimiBold),
      ),
      Spacer(),
      customIconButton(
          svgIcon: kSvgHeart,
          color: AppColors.greyColor300,
          ontap: () {
            addFavProductBottomSheet(Get.context!, () {});
          }),
    ],
  );
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
              aspectRatio: 2.8,
              viewportFraction: 1,
              disableCenter: true,
              onPageChanged: (index, reason) {
                sliderIndex.value = index;
              },
            )),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              final dotSize = sliderIndex.value == index ? 25.0 : 7.0;
              return Dot(isActive: dotSize > 12, width: dotSize);
            }),
          ),
        ),
      ],
    ),
  );
}

Widget _buildCustomProductCard(ShopController controller) {
  return Column(
    children: [
      GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = controller.products[index];
          return ProductCard(
            product: product,
            ontap: () {
              Get.toNamed(Routes.PRODUCT_DETAIL);
            },
          );
        },
      ),
    ],
  );
}

Widget _buildShopRow(ShopController controller) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(controller.servicesCategories.length, (index) {
        return Obx(() => Padding(
              padding: EdgeInsets.only(right: 7.w),
              child: GestureDetector(
                onTap: () => controller.selectedIndex.value = index,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: controller.selectedIndex.value == index
                        ? Colors.black
                        : null,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.selectedIndex.value == index
                          ? Colors.black
                          : AppColors.whiteColor2,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    child: controller.selectedIndex.value == index
                        ? Text(
                            controller.servicesCategories[index].category,
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                              fontFamily: FontsFamily.OpenSansRegular,
                              color: Colors.white,
                              fontSize: 13.sp,
                            ),
                          )
                        : Text(
                            controller.servicesCategories[index].category,
                            style: AppTextStyle.textStyleSmallNormal.copyWith(
                                fontFamily: FontsFamily.OpenSansRegular,
                                fontSize: 13.sp,
                                color: AppColors.customColor),
                          ),
                  ),
                ),
              ),
            ));
      }),
    ),
  );
}

Widget _buildShopButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
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
      Spacer(),
      customIconButton(svgIcon: kSvgFilter1, color: AppColors.whiteColor1),
      SizedBox(width: 5.w),
      customIconButton(
          svgIcon: kSvgSearch,
          color: AppColors.whiteColor1,
          ontap: () {
            Get.toNamed(Routes.PRODUCT_SEARCH);
          }),
    ],
  );
}

void addFavProductBottomSheet(BuildContext context, Function() onTap) {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.whiteColor1,
    builder: (context) {
      return GetBuilder<ShopController>(
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
                    customAppbarWithCloseIcon(title: 'Favourites'),
                    SizedBox(height: 20.h),
                    buildHorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBuyNowCard(
                              kpng: kPngLaptop,
                              name: 'Macbook Pro 2021',
                              description: '256GB SSD, 16GB, VGA...',
                              priceInBTC: '0.000000043BTC',
                              priceInUSD: '\$1,200',
                              ksvg: kSvgTrash),
                          SizedBox(height: 20.h),
                          buildBuyNowCard(
                              kpng: kPngLaptop,
                              name: 'Macbook Pro 2021',
                              description: '256GB SSD, 16GB, VGA...',
                              priceInBTC: '0.000000043BTC',
                              priceInUSD: '\$1,200',
                              ksvg: kSvgTrash),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
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
