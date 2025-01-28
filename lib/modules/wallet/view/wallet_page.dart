import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import 'package:treyd_crypto/modules/wallet/view/mobile/wallet_mobile_view.dart';
import '../../../core/utils/app_colors.dart';

class WalletPage extends StatelessWidget {
  WalletPage({super.key});

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
          smallScreen: WalletMobileView(),
        ),
      ),
    );
  }
}
