import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final IconData? iconData;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextStyle? errorStyle;
  final TextStyle? labelStyle;
  final InputBorder? errorBorder;
  final bool isObscure;
  final TextInputType? keyboardType;
  final double radius;
  final Offset? boxShadowOffset;
  final Color? boxShadowColor;
  final Color? disableBorderColor;
  final double? disableBorderWidth;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? enabled;
  final bool? isRequired;
  final ValueChanged<String>? onSubmitted;
  final Function()? onEditingComplete;
  final GestureTapCallback? onTap;
  final String? restorationId;
  final double? height;
  final Color? backgroundColor;
  final bool? isTitleEnable;
  final String? title;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final bool isDropdownDisable;
  // final bool filled;
  // final Color fillColor;
  final bool showOutlineFocus;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  const CustomTextField({
    Key? key,
    this.iconData,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.controller,
    this.textInputFormatter,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onSubmitted,
    this.onTap,
    this.errorStyle,
    this.height,
    this.hintText = '',
    this.errorBorder,
    this.isObscure = false,
    this.radius = 5,
    this.boxShadowOffset,
    this.boxShadowColor,
    this.textInputAction,
    this.labelStyle,
    this.enabled,
    this.keyboardType,
    this.isRequired = false,
    this.backgroundColor = AppColors.transParentColor,
    this.onEditingComplete,
    this.restorationId,
    this.disableBorderColor,
    this.disableBorderWidth,
    this.isTitleEnable = true,
    this.title = '',
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.buildCounter,
    this.isDropdownDisable = false,
    // this.filled = false,
    // this.fillColor = Colors.transparent,
    this.showOutlineFocus = false,
    this.contentPadding = const EdgeInsets.only(left: 12, right: 20),
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // decoration: BoxDecoration(
      //     // color: AppColors.blueColor,
      //     borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: Padding(
        // padding: EdgeInsets.only(right: 2,left: 2,bottom: suffixIcon != null ? 0 : 2.0,top: suffixIcon != null ? 5.0 : 3.0),
        padding: EdgeInsets.only(
            right: 0,
            left: 0,
            bottom: suffixIcon != null ? 0 : 0.0,
            top: suffixIcon != null ? 0.0 : 0.0),
        child: Material(
            color: backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isTitleEnable!)
                  Text(
                    title!,
                    style: AppTextStyle.textStyleXSmallNormal.copyWith(
                        fontFamily: FontsFamily.OpenSansRegular,
                        color: isDropdownDisable
                            ? AppColors.greyColor
                            : AppColors.customColor),
                  ),
                if (isTitleEnable!)
                  const SizedBox(
                    height: 20,
                  ),
                TextFormField(
                  textAlign: textAlign ?? TextAlign.start,
                  onTap: onTap,
                  onEditingComplete: onEditingComplete,
                  onFieldSubmitted: onSubmitted,
                  controller: controller,
                  validator: validator,
                  obscureText: isObscure,
                  inputFormatters: textInputFormatter,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction ?? TextInputAction.next,
                  initialValue: initialValue,
                  onChanged: onChanged,
                  onSaved: onSaved,
                  enabled: enabled,
                  style: AppTextStyle.textStylexLarge.copyWith(
                    fontFamily: FontsFamily.TsukimiMedium
                  ),
                  restorationId: restorationId,
                  maxLines: maxLines ?? 1,
                  maxLength: maxLength,
                  maxLengthEnforcement: maxLengthEnforcement,
                  buildCounter: buildCounter,
                  decoration: InputDecoration(
                    contentPadding: contentPadding,
                    alignLabelWithHint: true,
                    hintText: hintText,
                    hintStyle: AppTextStyle.textStyleSmallNormal.copyWith(
                        color: AppColors.greyColor500,
                        fontFamily: FontsFamily.OpenSansRegular),
                    fillColor: AppColors.whiteColor1,
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    border: InputBorder.none,

                    // label: isTitleEnable! ? const Text('') :
                    // Wrap(
                    //   children: [
                    //     Text(hintText!,style: AppTextStyle.textStyleXSmallNormal.apply(color: AppColors.greyColor),),
                    //     Text(isRequired == true ?  " *":"", style:  AppTextStyle.textStyleSmallBold.copyWith(color: AppColors.redColor)),
                    //   ],
                    // ) ,
                    labelStyle: labelStyle ??
                        AppTextStyle.textStyleXSmallNormal
                            .apply(color: AppColors.greyColor),
                    errorStyle: errorStyle ??
                        AppTextStyle.textStyleXSmallNormal.copyWith(
                          color: AppColors.redColor,
                          fontSize: 10,
                        ),
                    errorMaxLines: 2,
                    ),
                  ),
              ],
            )),
      ),
    );
  }
}

class CustomTextField1 extends StatelessWidget {
  final String? hintText;
  final IconData? iconData;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextStyle? errorStyle;
  final TextStyle? labelStyle;
  final InputBorder? errorBorder;
  final bool isObscure;
  final TextInputType? keyboardType;
  final double radius;
  final Offset? boxShadowOffset;
  final Color? boxShadowColor;
  final Color? disableBorderColor;
  final double? disableBorderWidth;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? enabled;
  final bool? isRequired;
  final ValueChanged<String>? onSubmitted;
  final Function()? onEditingComplete;
  final GestureTapCallback? onTap;
  final String? restorationId;
  final double? height;
  final Color? backgroundColor;
  final bool? isTitleEnable;
  final String? title;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final bool isDropdownDisable;
  // final bool filled;
  // final Color fillColor;
  final bool showOutlineFocus;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  const CustomTextField1({
    Key? key,
    this.hintText = '',
    this.iconData,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.controller,
    this.textInputFormatter,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onSubmitted,
    this.onTap,
    this.errorStyle,
    this.height,
    this.errorBorder,
    this.isObscure = false,
    this.radius = 5,
    this.boxShadowOffset,
    this.boxShadowColor,
    this.textInputAction,
    this.labelStyle,
    this.enabled,
    this.keyboardType,
    this.isRequired = false,
    this.backgroundColor = AppColors.transParentColor,
    this.onEditingComplete,
    this.restorationId,
    this.disableBorderColor,
    this.disableBorderWidth,
    this.isTitleEnable = true,
    this.title = '',
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.buildCounter,
    this.isDropdownDisable = false,
    // this.filled = false,
    // this.fillColor = Colors.transparent,
    this.showOutlineFocus = false,
    this.contentPadding = const EdgeInsets.only(left: 12, right: 20),
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // decoration: BoxDecoration(
      //     // color: AppColors.blueColor,
      //     borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: Padding(
        // padding: EdgeInsets.only(right: 2,left: 2,bottom: suffixIcon != null ? 0 : 2.0,top: suffixIcon != null ? 5.0 : 3.0),
        padding: EdgeInsets.only(
            right: 0,
            left: 0,
            bottom: suffixIcon != null ? 0 : 0.0,
            top: suffixIcon != null ? 0.0 : 0.0),
        child: Material(
            color: backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isTitleEnable!)
                  Text(
                    title!,
                    style: AppTextStyle.textStyleXSmallNormal.copyWith(
                        fontFamily: FontsFamily.OpenSansRegular,
                        color: isDropdownDisable
                            ? AppColors.greyColor
                            : AppColors.greyColor300),
                  ),
                if (isTitleEnable!)
                  const SizedBox(
                    height: 5,
                  ),
                TextFormField(
                  textAlign: textAlign ?? TextAlign.start,
                  onTap: onTap,
                  onEditingComplete: onEditingComplete,
                  onFieldSubmitted: onSubmitted,
                  controller: controller,
                  validator: validator,
                  obscureText: isObscure,
                  inputFormatters: textInputFormatter,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction ?? TextInputAction.next,
                  initialValue: initialValue,
                  onChanged: onChanged,
                  onSaved: onSaved,
                  enabled: enabled,
                  style: AppTextStyle.textStyleXSmallNormal,
                  restorationId: restorationId,
                  maxLines: maxLines ?? 1,
                  maxLength: maxLength,
                  maxLengthEnforcement: maxLengthEnforcement,
                  buildCounter: buildCounter,
                  decoration: InputDecoration(
                    contentPadding: contentPadding,
                    alignLabelWithHint: true,
                    hintText: "$hintText",
                    hintStyle: AppTextStyle.textStyleSmallNormal.copyWith(
                        color: AppColors.greyColor500,
                        fontFamily: FontsFamily.OpenSansRegular),
                    filled: true,
                    fillColor: AppColors.whiteColor2,
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,

                    // label: isTitleEnable! ? const Text('') :
                    // Wrap(
                    //   children: [
                    //     Text(hintText!,style: AppTextStyle.textStyleXSmallNormal.apply(color: AppColors.greyColor),),
                    //     Text(isRequired == true ?  " *":"", style:  AppTextStyle.textStyleSmallBold.copyWith(color: AppColors.redColor)),
                    //   ],
                    // ) ,
                    labelStyle: labelStyle ??
                        AppTextStyle.textStyleXSmallNormal
                            .apply(color: AppColors.greyColor),
                    errorStyle: errorStyle ??
                        AppTextStyle.textStyleXSmallNormal.copyWith(
                          color: AppColors.redColor,
                          fontSize: 10,
                        ),
                    errorMaxLines: 2,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(color: AppColors.redColor, width: 2),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
