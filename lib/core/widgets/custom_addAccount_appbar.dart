import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';
import 'custom_widgets.dart';

PreferredSizeWidget customAddAccountAppbar({
  Function()? ontap,
  required String title,
  bool isShowBack = true,
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transParentColor,
    automaticallyImplyLeading: false,
    leading: ontap != null
        ? GestureDetector(
      onTap: ontap,
      child: SvgPicture.asset(
        kSvgArrowBack,
        fit: BoxFit.scaleDown,
      ),
    )
        : null,
    title: Text(
      title,
      style: AppTextStyle.textStyleMediumNormal
          .copyWith(fontSize: 20.sp, fontFamily: FontsFamily.OpenSansMedium),
    ),
  );
}

Widget customAppbarWithCloseIcon({required String title}) {
  return buildHorizontalPadding(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.textStyleLargeNormal
              .copyWith(fontFamily: FontsFamily.OpenSansMedium,
          fontSize: 20.sp),
        ),
        GestureDetector(
          onTap: () => Get.back(),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.whiteColor1,
            child: SvgPicture.asset(
              kSvgCross,
              fit: BoxFit.scaleDown,
            ),
          ),
        )
      ],
    ),
  );
}
