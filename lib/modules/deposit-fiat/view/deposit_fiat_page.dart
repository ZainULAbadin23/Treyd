import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import 'mobile/deposit_fiat_mobile_view.dart';

class DepositFiatPage extends StatelessWidget {
  DepositFiatPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      resizeToAvoidBottomInset: true,
      appBar: customAppbar(title: "1",ontap: (){Get.back();}),
      body: SizedBox(
        height: _size.height,
        child: ResponsiveWidget(
          smallScreen: DepositFiatMobileView(),
        ),
      ),
    );
  }
}
