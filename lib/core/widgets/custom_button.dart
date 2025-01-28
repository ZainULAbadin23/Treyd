import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        this.onPressed,
        required this.title,
        this.textColor,
        this.color,
        this.isCircleButton = false,
        this.titleTextStyle,
        this.radius,
        this.isTitleAndIcon = false,
        this.titleIcon,
        this.padding,
        this.isTitleUpperCase = true})
      : super(key: key);
  final Function()? onPressed;
  final String title;
  final TextStyle? titleTextStyle;
  final Color? textColor;
  final Color? color;
  final bool? isCircleButton;
  final double? radius;
  final bool isTitleAndIcon;
  final bool isTitleUpperCase;
  final Widget? titleIcon;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    ButtonStyle styleFrom;
    Widget child;
    if (!isCircleButton!) {
      styleFrom = ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: AppColors.greyColor.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5.0),
        ),
        backgroundColor: color ?? AppColors.primaryColor,
        padding: padding ??
            const EdgeInsets.symmetric(vertical: 20.5, horizontal: 25),
        minimumSize: Size.zero,
      );
    } else {
      styleFrom = ElevatedButton.styleFrom(
        foregroundColor: AppColors.greyColor.withOpacity(0.6),
        shape: const CircleBorder(),
        backgroundColor: color ?? AppColors.primaryColor,
        padding: padding ?? const EdgeInsets.all(24),
      );
    }
    child = Text(
      isTitleUpperCase ? title.trim().toUpperCase() : title.trim(),
      style: titleTextStyle ??
          AppTextStyle.textStyleMediumNormal.merge(
            TextStyle(
              fontFamily: FontsFamily.OpenSansMedium,
              color: textColor ?? AppColors.whiteColor,
            ),
          ),
    );
    if (isTitleAndIcon) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          const SizedBox(
            width: 5,
          ),
          titleIcon!,
        ],
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: styleFrom,
    );
  }
}

Widget buildLoginText(
    {required String text, Function()? ontap,required Color color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: ontap,
        child: Text(
          text,
          style: AppTextStyle.textStyleMediumNormal.copyWith(
            fontFamily: FontsFamily.OpenSansMedium,
            color:color,
          ),
        ),
      ),
    ],
  );
}


Widget buildLoginRegisterText(
    {required String text, required String gradient, Function()? ontap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${text}\t",
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          color: AppColors.customColor,
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
      GestureDetector(
        onTap: ontap,
        child: Text(
          gradient,
          style: AppTextStyle.textStyleSmallNormal.copyWith(
            color: AppColors.primaryColor,
            fontFamily: FontsFamily.OpenSansSemiBold,
          ),
        ),
      ),
    ],
  );
}
customScanButton({Function()? ontap,required Svgpath}){
  return GestureDetector(
    onTap: ontap,
    child: SvgPicture.asset(
    Svgpath),
  );
}

customNavigationButton({required String text, Function()? ontap}) {
  return Container(
    height: 80.h,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h, right: 30.w, left: 30.w),
          child: CustomButton(
            onPressed: ontap,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            radius: 8,
            title: text,
            isTitleUpperCase: false,
          ),
        )
      ],
    ),
  );
}
