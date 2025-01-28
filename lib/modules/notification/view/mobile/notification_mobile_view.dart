import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treyd_crypto/modules/notification/controller/notification_controller.dart';
import '../../../../core/assets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_widgets.dart';

class NotificationMobileView extends StatelessWidget {
  NotificationMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              _buildNotificationHeader(
                  ontap: () {
                    Get.back();
                  },
                  title: 'Notifications'),
              SizedBox(height: 20.h),
              _buildTabBar(controller),
              buildHorizontalPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTransactionPinText(text: 'All Notifications'),
                    _buildMarkAllAsReadButton(),
                  ],
                ),
              ),
              buildHorizontalPadding(
                  child: buildTransactionPinText(
                      text: 'Today', color: AppColors.blackColor)),
              SizedBox(
                height: 20.h,
              ),
              _buildNotificationList(controller),
            ],
          );
        });
  }
}

Widget _buildNotificationHeader({Function()? ontap, required String title}) {
  return buildHorizontalPadding(
    child: Row(
      children: [
        Text(
          title,
          style: AppTextStyle.textStyleLargeNormal
              .copyWith(fontFamily: FontsFamily.OpenSansMedium),
        ),
        Spacer(),
        GestureDetector(
          onTap: ontap,
          child: SvgPicture.asset(
            kSvgCross,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    ),
  );
}

Widget _buildTabBar(NotificationController controller) {
  return Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _tabButton(controller, 'All', 'all'),
          _tabButton(controller, 'Unread', 'unread'),
          _tabButton(controller, 'Read', 'read'),
        ],
      ));
}

Widget _tabButton(
    NotificationController controller, String label, String value) {
  return GestureDetector(
    onTap: () => controller.selectedFilter.value = value,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 35.w),
      margin: EdgeInsets.symmetric(horizontal: 8.h),
      decoration: BoxDecoration(
        color: controller.selectedFilter.value == value
            ? AppColors.blackColor
            : AppColors.greyColor200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyle.textStyleSmallNormal.copyWith(
          color: controller.selectedFilter.value == value
              ? AppColors.whiteColor
              : AppColors.blackColor,
          fontFamily: FontsFamily.OpenSansRegular,
        ),
      ),
    ),
  );
}

Widget _buildMarkAllAsReadButton() {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {},
      child: Text(
        "Mark all as read",
        style: AppTextStyle.textStyleSmallNormal.copyWith(
            fontFamily: FontsFamily.OpenSansRegular,
            color: AppColors.primaryColor),
      ),
    ),
  );
}

Widget _buildNotificationList(NotificationController controller) {
  return Expanded(
    child: Container(
      width: double.maxFinite,
      color: AppColors.whiteColor1,
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.notifications.map((notification) {
              return _notificationItem(notification, controller);
            }).toList(),
          ),
        ),
      ),
    ),
  );
}

Widget _notificationItem(
    AppNotification notification, NotificationController controller) {
  if (controller.selectedFilter.value == 'unread') {
    if (notification.isRead == true) {
      return SizedBox();
    }
  } else if (controller.selectedFilter.value == 'read') {
    if (notification.isRead == false) {
      return SizedBox();
    }
  }
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 7.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: !notification.isRead
                            ? AppColors.primaryColor
                            : AppColors.greyColor400),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(notification.title,
                      style: AppTextStyle.textStyleMediumNormal.copyWith(
                          fontFamily: FontsFamily.OpenSansMedium,
                          color: notification.isRead
                              ? AppColors.greyColor400
                              : Colors.black)),
                  Spacer(),
                  Text(notification.time,
                      style: AppTextStyle.textStyleXSmallNormal.copyWith(
                          fontFamily: FontsFamily.OpenSansRegular,
                          color: AppColors.customColor)),
                ],
              ),
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(children: [
                  TextSpan(text:notification.description,
                      style: AppTextStyle.textStyleSmallNormal.copyWith(
                          fontFamily: FontsFamily.OpenSansRegular,
                          color: AppColors.greyColor400)),
                  TextSpan(text: '0.000045BTC ',
                      style: AppTextStyle.textStyleSmallNormal.copyWith(
                          fontFamily: FontsFamily.OpenSansRegular,),),
                  TextSpan(text: 'was Successful.',
                      style: AppTextStyle.textStyleSmallNormal.copyWith(
                          fontFamily: FontsFamily.OpenSansRegular,
                          color: AppColors.greyColor400)),
                ]),
              ),
              Divider(
                thickness: 0.5,
                color: AppColors.greyColor400,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
