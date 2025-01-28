import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import '../../../core/assets/constants.dart';
import '../../../core/utils/app_colors.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_button.dart';
import 'mobile/account_mobile_view.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      resizeToAvoidBottomInset: true,
      appBar: buildCustomAppbar(ontap: () {Get.back();}, title: 'Logout'),
      body: SizedBox(
        height: _size.height,
        child: ResponsiveWidget(
          smallScreen: AccountMobileView(),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildCustomAppbar({Function()? ontap, String? title}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transParentColor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: GestureDetector(
      onTap: ontap,
      child: SvgPicture.asset(
        kSvgArrowBack,
        fit: BoxFit.scaleDown,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: buildLoginText(
          text: title ?? '',
          ontap: () {
            Get.back();
          },
          color: AppColors.redColorDark,
        ),
      ),
    ],
  );
}
