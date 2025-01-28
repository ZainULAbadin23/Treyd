import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

Widget customIconButton({
  required String svgIcon,
  required Color color,
  Function()? ontap,
  bool showBadge = false,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 52,
          width: 52,
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color.withOpacity(0.06),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: SvgPicture.asset(
            svgIcon,
          ),
        ),
        if (showBadge)
          Positioned(
            right: 10.w,
            top: 12.h,
            child: Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                color: AppColors.greyColor500,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
      ],
    ),
  );
}

Widget buildIconContainer(String assetName) {
  return Container(
    padding: EdgeInsets.all(8.sp),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: SvgPicture.asset(assetName),
  );
}
