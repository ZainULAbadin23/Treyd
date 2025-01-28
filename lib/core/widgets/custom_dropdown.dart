// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../global-models/drop-down-model/drop_down_model.dart';
import '../assets/constants.dart';
import '../utils/app_colors.dart';
import 'app_text_style.dart';
import 'custom_text_field.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    Key? key,
    this.initialValue,
    required this.hintText,
    required this.titleText,
    this.validator,
    this.disableSelection = false,
    this.onPressedClear,
    required this.dropdownList,
    required this.isSelectedIndex,
    required this.onSelected,
    this.enableSearch = true,
    this.backgroundColor = AppColors.transParentColor,
    this.ignoreId,
    this.textFieldHeight,
    this.isTitleEnable = true,
  }) : super(key: key);

  final String? initialValue;
  final String hintText;
  final int isSelectedIndex;
  final String titleText;
  final FormFieldValidator<String>? validator;
  final bool disableSelection;
  final void Function()? onPressedClear;
  final List<DropdownModel> dropdownList;
  final void Function(DropdownModel) onSelected;
  final bool enableSearch;
  final Color backgroundColor;
  final int? ignoreId;
  final double? textFieldHeight;
  final bool? isTitleEnable;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: !disableSelection
              ? () {
            if (!Get.isSnackbarOpen) {
              Get.bottomSheet(
                _bottomSheet(context),
                isScrollControlled: true,
                ignoreSafeArea: false,
                isDismissible: true,
                backgroundColor: AppColors.transParentColor,
              );
            }
          }
              : null,
          child: CustomTextField1(
            hintText: hintText,
            title: 'Bank',
            isTitleEnable: isTitleEnable,
            controller:TextEditingController(),
            enabled: false,
            validator: validator,
            isRequired: validator != null,
            suffixIcon: SvgPicture.asset(kSvgArrowDown, fit: BoxFit.scaleDown),
            isDropdownDisable: disableSelection,
          ),
        ),
      ],
    );
  }

  _bottomSheet(BuildContext context) {
    return _CustomDropdownView(
      heading: titleText,
      dropdownList: dropdownList,
      onSelected: onSelected,
      enableSearch: enableSearch,
      backgroundColor: backgroundColor,
      ignoreId: ignoreId,
      isSelectedIndex: isSelectedIndex,
    );
  }
}

class _CustomDropdownView extends GetView<_CustomDropdownController> {
  _CustomDropdownView(
      {Key? key,
        required this.heading,
        required this.dropdownList,
        required this.enableSearch,
        required this.onSelected,
        required this.backgroundColor,
        this.ignoreId,
        required this.isSelectedIndex})
      : super(key: key);

  final String heading;
  final bool enableSearch;
  final List<DropdownModel> dropdownList;
  final void Function(DropdownModel) onSelected;
  final Color backgroundColor;
  final int? ignoreId;
  final int isSelectedIndex;

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: GetBuilder<_CustomDropdownController>(
          init: _CustomDropdownController(dropdownList),
          builder: (_) {
            return Container(
              margin: EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: size.height * 0.06,
                  bottom: size.height * 0.06),
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Column(
                children: [
                  //  _header(),
                  SizedBox(
                    height: size.height * 0.85,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          if (enableSearch)
                            CustomTextField(
                              controller: controller.searchTextController,
                              hintText: kSvgSearch,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              suffixIcon: Obx(() =>
                                  _suffixIcon(controller.searchText.value)),
                              onChanged: controller.searching,
                            ),
                          Flexible(
                              child: GetBuilder<_CustomDropdownController>(
                                id: "update-list",
                                builder: (_) {
                                  return _listView(isSelectedIndex);
                                },
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _suffixIcon(String text) {
    if (text.isNotEmpty) {
      return IconButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          controller.searchTextController.clear();
          controller.searchText.value = "";
          controller.updateList();
        },
        icon: const Icon(
          Icons.clear,
          color: AppColors.redColor,
        ),
      );
    }
    return const Icon(Icons.search);
  }

  Widget _listView(int index) {
    RxInt isSelect = (index).obs;
    final list = ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        itemCount: controller.searchText.value.isNotEmpty
            ? controller.searchList.length
            : dropdownList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.searchText.value.isNotEmpty
              ? controller.searchList.elementAt(index)
              : dropdownList.elementAt(index);
          if (ignoreId == item.id) {
            return Container();
          }
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5, top: index == 0 ? 20 : 5),
                child: GestureDetector(
                  onTap: () {
                    isSelect.value = index;
                    if (controller.searchText.value.isNotEmpty) {
                      for (int i = 0; i < dropdownList.length; i++) {
                        if (dropdownList[i].name!.toLowerCase() ==
                            item.name!.toLowerCase()) {
                          onSelected(dropdownList[i]);
                          break;
                        }
                      }
                    } else {
                      onSelected(item);
                    }
                    Navigator.pop(context);
                  },
                  child: Obx(
                        () => Container(
                      height: 50.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: isSelect == index
                              ? AppColors.whiteColor1
                              : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isSelect == index
                                  ? AppColors.primaryColor
                                  : AppColors.halfwhiteColor)),
                      child: Row(
                        children: [
                          Text(
                            item.name.toString(),
                            style: AppTextStyle.textStyleSmallNormal,
                          ),
                          Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelect.value == index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                border: Border.all(
                                    color: isSelect == index
                                        ? AppColors.primaryColor
                                        : AppColors.halfwhiteColor)),
                            child: isSelect == index
                                ? Center(
                              child: Icon(
                                Icons.check,
                                color: AppColors.whiteColor,
                                size: 13,
                              ),
                            )
                                : null,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              // ListTile(
              //   dense: true,
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              //   title: Text(
              //     item.name!,
              //     style: AppTextStyle.textStyleSmallBold
              //         .copyWith(color: AppColors.greyColor800),
              //   ),
              //   onTap: () {
              //     if (controller.searchText.value.isNotEmpty) {
              //       for (int i = 0; i < dropdownList.length; i++) {
              //         if (dropdownList[i].name!.toLowerCase() ==
              //             item.name!.toLowerCase()) {
              //           onSelected(dropdownList[i]);
              //           break;
              //         }
              //       }
              //     } else {
              //       onSelected(item);
              //     }
              //     Navigator.pop(context);
              //   },
              // ),
              // Divider(
              //   color: AppColors.greyColor400,
              // ),
            ],
          );
        });
    if (controller.searchText.value.isEmpty) {
      return dropdownList.isNotEmpty ? list : noRecord();
    } else {
      return controller.searchList.isNotEmpty ? list : noRecord();
    }
  }

  noRecord() {}
}

class _CustomDropdownController extends GetxController {
  final List<DropdownModel> dropdownList;
  _CustomDropdownController(this.dropdownList);

  final searchTextController = TextEditingController();
  final searchText = "".obs;
  List<DropdownModel> searchList = [];

  void searching(String value) {
    searchList = [];
    searchText.value = value;
    if (value.isNotEmpty) {
      if (dropdownList.isNotEmpty) {
        for (var element in dropdownList) {
          if (element.name!.toLowerCase().contains(value.toLowerCase())) {
            searchList.add(element);
          }
        }
      }
    }
    updateList();
  }

  void updateList() {
    update(["update-list"]);
  }
}
