import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import '../../../core/utils/app_colors.dart';
import 'package:get/get.dart';
import 'account_page.dart';
import 'mobile/security_mobile_view.dart';

class SecurityPage extends StatelessWidget {
  SecurityPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      resizeToAvoidBottomInset: true,
      appBar: buildCustomAppbar(ontap: () {Get.back();}, title: ''),
      body: SizedBox(
        height: _size.height,
        child: ResponsiveWidget(
          smallScreen: SecurityMobileView(),
        ),
      ),
    );
  }
}
