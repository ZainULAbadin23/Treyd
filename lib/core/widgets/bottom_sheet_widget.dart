import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import 'app_text_style.dart';
import 'custom_button.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final bool buttonsHide;
  final String positiveButtonText;
  final String negativeButtonText;
  final Function()? positiveButtonOnPressed;
  final Function()? crossButtonOnPressed;
  final double height;
  final isHeaderShow;

  BottomSheetWidget({
    required this.title,
    required this.body,
    required this.height,
    this.isHeaderShow = true,
    this.buttonsHide = false,
    this.positiveButtonText = 'Save',
    this.negativeButtonText = "Cancel",
    required this.positiveButtonOnPressed,
    required this.crossButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: Get.width,
      color: Colors.white.withOpacity(0.95),
      child: Column(
        children: [
          /// header
          if (isHeaderShow) _bottomSheetHeader(),
          if (isHeaderShow)
            SizedBox(
              height: height * 0.02,
            ),

          /// body
          body,
          // Expanded(child: Container()),
          /// buttons
          if (!buttonsHide) _bottomSheetBottom(),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }

  _bottomSheetHeader() {
    return Container(
      height: 56,
      width: Get.width,
      color: AppColors.primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style:
                    Get.theme.textTheme.titleMedium?.apply(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          InkWell(
            onTap: crossButtonOnPressed,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.clear,
                color: AppColors.whiteColor,
                size: 25,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
        ],
      ),
    );
  }

  _bottomSheetBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: positiveButtonOnPressed,
                title: positiveButtonText,
                titleTextStyle: AppTextStyle.textStyleXSmallNormal
                    .copyWith(color: AppColors.whiteColor),
                textColor: AppColors.whiteColor,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
