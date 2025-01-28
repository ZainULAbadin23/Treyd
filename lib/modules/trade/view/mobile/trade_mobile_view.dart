import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/utils/app_colors.dart';
import 'package:treyd_crypto/core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_crypto_chart.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../controller/trade_controller.dart';

class TradeMobileView extends StatelessWidget {
  const TradeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TradeController>(
      init: TradeController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                buildLargeHeaderText(title: 'Treyd'),
                SizedBox(
                  height: 25.h,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.details.map((detail) {
                      return _buildTreydRanking(
                        controller,
                        title: detail["title"] ?? "",
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 25.h),
                buildRecommendedCard(),
                SizedBox(
                  height: 20.h,
                ),
                _buildTradeSummary(
                  svg: kSvgTradePageSummary,
                ),
                SizedBox(
                  height: 10.h,
                ),
                _buildDateRow(controller),
                SizedBox(height: 25.h),
                CustomCryptoChart(),
                SizedBox(
                  height: 30.h,
                ),
                _buildButtonRow(),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildTreydRanking(TradeController controller, {required String title}) {
  if (title == "Top 5") {
    return Text(
      title,
      style: AppTextStyle.textStyleSmallNormal.copyWith(
        fontFamily: FontsFamily.OpenSansMedium,
      ),
    );
  }
  return Text(
    title,
    style: AppTextStyle.textStyleSmallNormal.copyWith(
        fontFamily: FontsFamily.OpenSansMedium, color: AppColors.greyColor500),
  );
}

Widget _buildTradeSummary({required String svg}) {
  return Center(
    child: Container(
      width: double.infinity,
      child: SvgPicture.asset(
        svg,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget _buildButtonRow() {
  return Row(
    children: [
      Expanded(
        child: CustomButton(
          onPressed: () {},
          color: AppColors.primaryColor,
          radius: 16,
          padding: EdgeInsets.symmetric(vertical: 17.h),
          title: 'Buy',
          isTitleUpperCase: false,
        ),
      ),
      SizedBox(
        width: 15.w,
      ),
      Expanded(
        child: CustomButton(
          onPressed: () {},
          color: Colors.black87,
          radius: 16,
          padding: EdgeInsets.symmetric(vertical: 17.h),
          title: 'Sell',
          isTitleUpperCase: false,
        ),
      ),
    ],
  );
}

Widget _buildDateRow(TradeController controller) {
  return Row(
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
  );
}
