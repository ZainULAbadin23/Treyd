import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import 'mobile/swap_mobile_view.dart';

class SwapPage extends StatelessWidget {
  SwapPage({super.key});

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
          smallScreen: SwapMobileView(),
        ),
      ),
    );
  }
}
