import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/utils/app_colors.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import 'package:treyd_crypto/modules/login-register/view/mobile/otp_reg_mobile_view.dart';

class OtpRegPage extends StatelessWidget {
  OtpRegPage({super.key});

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
          smallScreen: OtpRegMobileView(),
        ),
      ),
    );
  }
}
