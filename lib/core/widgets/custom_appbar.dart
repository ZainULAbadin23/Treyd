import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import 'app_text_style.dart';
import 'custom_button.dart';

PreferredSizeWidget customAppbar({
  Function()? ontap,
  required String title
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transParentColor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading:GestureDetector(
      onTap: ontap,
      child: SvgPicture.asset(
        kSvgArrowBack,
        fit: BoxFit.scaleDown,
      ),
    ),
    title: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCustomAppbarText(title: title),
      ],
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: buildLoginText(
          text: 'Cancel',
          ontap: (){Get.back();},
          color: AppColors.redColorDark,
        ),
      ),
    ],
  );
}

Widget _buildCustomAppbarText({required String title,}){
  return Row(
    children: [
      Text(
        title,
        style: AppTextStyle.textStyleMediumNormal
            .copyWith( fontFamily: FontsFamily.OpenSansRegular),
      ),
      SizedBox(width: 4.w,),
      Text(
        'of 3',
        style: AppTextStyle.textStyleMediumNormal
            .copyWith(fontFamily: FontsFamily.OpenSansRegular,
        color: AppColors.greyColor),
      ),
    ],
  );
}






