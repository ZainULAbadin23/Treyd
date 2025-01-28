import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';

Widget customBuildMenuItem(int index, List<dynamic> menu,{
  required String name,
  required String icon,
  required double price,
  required double percentageChange,
  required double changeValue,
  required double amount,
  String? graph = '',
}) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 84.h,
          width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 26.h,
                width: 26.w,
                child: Image.asset(
                  icon,
                  fit: BoxFit.contain,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                name,
                style: AppTextStyle.textStyleSmallBold.copyWith(
                  fontFamily: FontsFamily.OpenSansSemiBold,
                ),
              ),
              Spacer(),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: AppTextStyle.textStyleMediumBold.copyWith(
                  fontFamily: FontsFamily.OpenSansSemiBold,
                ),
              ),
            ],
          ),
          // Right Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(graph??''),
              Text(
                "${percentageChange}%",
                style: AppTextStyle.textStyleSmallBold.copyWith(
                  color: AppColors.redColor,
                  fontFamily: FontsFamily.OpenSansRegular,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "\$${changeValue}",
                style: AppTextStyle.textStyleSmallBold.copyWith(
                  color: AppColors.greyColor,
                  fontFamily: FontsFamily.OpenSansRegular,
                ),
              ),
              Spacer(),
              Text(
                "${amount} BTC",
                style: AppTextStyle.textStyleSmallBold.copyWith(
                  color: AppColors.customColor,
                  fontFamily: FontsFamily.OpenSansRegular,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
        SizedBox(height: 10.h),
      ],
    ),
  );
}
