import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/constants.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';

class CryptoCard extends StatelessWidget {
  final String img;
  CryptoCard({required this.img,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w, // Adjust the width as needed
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor200,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Icon, Name, and Chart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon and Name
              Row(
                children: [
                  Container(
                    width: 26.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      color: AppColors.yellowColor, // Background color for the icon
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(img,),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "BNB",
                    style: AppTextStyle.textStyleSmallBold.copyWith(
                      fontFamily: FontsFamily.OpenSansSemiBold,
                    ),
                  ),
                ],
              ),
              // Placeholder for Chart (replace with actual chart widget if needed)
              SvgPicture.asset(kSvgGraph),
            ],
          ),
          SizedBox(height: 16),
          // Bottom Row: Change and Value
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Change (+1.37)
              Text(
                "+1.37",
                style: AppTextStyle.textStyleSmallNormal.copyWith(
                  fontFamily: FontsFamily.OpenSansRegular,
                  color: AppColors.greenColor1
                ),
              ),
              // Value (216.3)
              Text(
                "216.3",
                style: AppTextStyle.textStyleSmallNormal.copyWith(
                  fontFamily: FontsFamily.OpenSansRegular,
                  color: AppColors.customColor
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}