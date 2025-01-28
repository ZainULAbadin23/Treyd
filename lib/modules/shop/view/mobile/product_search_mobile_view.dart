import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treyd_crypto/modules/shop/controller/product_search_controller.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_widgets.dart';

class ProductSearchMobileView extends StatelessWidget {
  ProductSearchMobileView({Key? key}) : super(key: key);
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductSearchController>(
        init: ProductSearchController(),
    builder: (controller) {
    return SingleChildScrollView(
      child: buildHorizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            buildHeader(ontap: (){Get.back();}, title: 'Search anything...'),
            SizedBox(height:20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor2,
                borderRadius: BorderRadius.circular(12),
              ),child:
            TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                hintStyle: AppTextStyle.textStyleMediumNormal.copyWith(
                    color: AppColors.greyColor500,
                    fontFamily: FontsFamily.OpenSansRegular),
                border: InputBorder.none,
                hintText: "Search",
                prefixIcon: SvgPicture.asset(
                  kSvgSearch,
                  fit: BoxFit.scaleDown,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),),
            SizedBox(height: 30.h),
            _buildShopRow(controller),
          ],
        ),
      ),
    );
  });
}


Widget _buildShopRow(ProductSearchController controller) {
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
}}
