import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_widgets.dart';

class SearchMobileView extends StatelessWidget {
  SearchMobileView({Key? key}) : super(key: key);
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildHorizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            buildHeader(ontap: (){Get.back();}, title: 'Select Crypto'),
        SizedBox(height:20.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor2,
            borderRadius: BorderRadius.circular(12),
          ),child:
            TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  hintStyle: AppTextStyle.textStyleMediumNormal.copyWith(
                      color: AppColors.greyColor500,
                      fontFamily: FontsFamily.OpenSansRegular),
                  border: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: SvgPicture.asset(
                    kSvgSearch,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                ),),
            Column(
              children: List.generate(10, (index) {
                return Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            kSvgCryptoLogo,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 10.h),
                          Text(
                            "TETHER",
                            style: AppTextStyle.textStyleMediumNormal.copyWith(
                                fontFamily: FontsFamily.OpenSansMedium,
                                height: 1.6,
                                color: AppColors.greyColor300),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Divider(thickness: 0.5,color: AppColors.greyColor200,),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}



