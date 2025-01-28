import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treyd_crypto/core/widgets/app_text_style.dart';

import '../utils/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String icon;
  final String label;
  final GestureTapCallback? ontap;

  const ActionButton({required this.icon, required this.label, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 35.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  color: AppColors.whiteColor,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  label,
                  style: AppTextStyle.textStyleSmallNormal.copyWith(
                      color: AppColors.whiteColor,
                      fontFamily: FontsFamily.OpenSansRegular),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
