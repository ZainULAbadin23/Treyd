import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import '../../../core/utils/app_colors.dart';
import 'mobile/shop_mobile_view.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: _size.height,
        child: ResponsiveWidget(
          smallScreen: ShopMobileView(),
        ),
      ),
    );
  }
}
