// ignore_for_file: must_be_immutable, deprecated_member_use
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:treyd_crypto/modules/shop/view/shop_page.dart';
import 'package:treyd_crypto/modules/trade/view/trade_page.dart';
import 'package:treyd_crypto/modules/wallet/view/wallet_page.dart';

import '../../../core/assets/constants.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text_style.dart';
import '../../home/view/home_page.dart';
import '../controller/bottom_navigation_controller.dart';

class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.currentIndex != 0) {
                controller.goTap(0);
                controller.currentIndex.value = 0;
              } else {}
              return false;
            },
            child: Scaffold(
              key: controller.scaffoldkey,
              backgroundColor: AppColors.whiteColor1,
              resizeToAvoidBottomInset: true,
              body: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomePage(),
                  WalletPage(),
                  TradePage(),
                  ShopPage(),
                ],
              ),
              bottomNavigationBar: Obx(
                    () => Container(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  height: 75.h,
                  child: Theme(
                    data: context.theme.copyWith(
                      splashColor: AppColors.transParentColor,
                      highlightColor: AppColors.transParentColor,
                    ),
                    child: BottomNavigationBar(
                        backgroundColor:AppColors.whiteColor1,
                        currentIndex: controller.currentIndex.value,
                        type: BottomNavigationBarType.fixed,
                        unselectedLabelStyle: TextStyle(
                             fontFamily: FontsFamily.OpenSansRegular),
                        selectedLabelStyle: TextStyle(
                             fontFamily: FontsFamily.OpenSansRegular),
                        showSelectedLabels: true,
                        unselectedItemColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                        selectedItemColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedItemColor,
                        showUnselectedLabels: true,
                        onTap: (value) {
                          controller.goTap(value);
                        },
                        items: [
                          BottomNavigationBarItem(
                            icon: customIconWidget(icon: kSvgHomeIcon),
                            activeIcon: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10.h),
                                  child: customIconWidget(icon: kSvgHomeSelected),
                                ),

                                Positioned(
                                  top: 0,
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            label: "",
                          ),
                          BottomNavigationBarItem(
                            icon: customIconWidget(icon: kSvgWalletIcon),
                            activeIcon: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10.h),
                                  child: customIconWidget(icon: kSvgWalletSelected),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            label: "",
                          ),
                          BottomNavigationBarItem(
                            icon: customIconWidget(icon: kSvgTradeIcon),
                            activeIcon: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10.h),
                                  child: customIconWidget(icon: kSvgTradeSelected),
                                ),

                                Positioned(
                                  top: 0,
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            label: "",
                          ),
                          BottomNavigationBarItem(
                            icon: customIconWidget(icon: kSvgShopIcon),
                            activeIcon: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10.h),
                                child: customIconWidget(icon: kSvgShopSelected),
                                ),

                                Positioned(
                                  top: 0,
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            label: "",
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

customIconWidget({required String icon}) {
  return Padding(
    padding: EdgeInsets.only(top:10.h),
    child: SvgPicture.asset(
      icon,
      fit: BoxFit.contain, // Scale icon correctly
      // Set custom width
    ),
  );
}
