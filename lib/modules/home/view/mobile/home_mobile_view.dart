import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/modules/home/controller/home_controller.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../../../core/widgets/custom_cryptocard_detail.dart';
import '../../../../core/widgets/custom_svgicon_button.dart';
import '../../../../core/widgets/custom_vertical_scroll.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../../routes/app_routes.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                _buildHeader(),
                SizedBox(height: 30.h),
                buildHomeContainer(
                  title: 'My Wallet',
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
                SizedBox(height: 10.h),
                SvgPicture.asset(kSvgTradeSummary),
                SizedBox(
                  height: 20.h,
                ),
                _buildHeadingText(text: 'Recommended'),
                SizedBox(
                  height: 20.h,
                ),
                buildRecommendedCard(),
                SizedBox(
                  height: 20.h,
                ),
                _buildHeadingText(text: 'My Assets'),
                SizedBox(
                  height: 20.h,
                ),
                custombuildVerticalScroll(
                  controller.cryptoCards,
                  (index) {
                    final card = controller
                        .cryptoCards[index]; // Access the card at index
                    return customBuildMenuItem(
                      index,
                      controller.cryptoCards,
                      name: card["name"] as String,
                      icon: card["icon"] as String,
                      price: card["price"] as double,
                      percentageChange: card["percentageChange"] as double,
                      changeValue: card["changeValue"] as double,
                      amount: card["amount"] as double,
                      graph: card["graph"] as String,
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

Widget _buildHeadingText({required String text}) {
  return Text(
    text,
    style: AppTextStyle.textStyleMediumBold
        .copyWith(fontFamily: FontsFamily.OpenSansSemiBold),
  );
}
Widget _buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: (){Get.toNamed(Routes.ACCOUNT);},
        child: SvgPicture.asset(
          kSvgProfile,
          height: 52.h,
          width: 52.w,
        ),
      ),
      Spacer(),
      customIconButton(svgIcon: kSvgSettings, color: AppColors.whiteColor1),
      SizedBox(width: 5.w),
      customIconButton(
          svgIcon: kSvgNotification, color: AppColors.primaryColor,ontap: (){Get.toNamed(Routes.NOTIFICATION);}),
    ],
  );
}
