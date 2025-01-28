import 'package:flutter/material.dart';
import 'package:treyd_crypto/core/widgets/responsive_widget.dart';
import 'package:treyd_crypto/modules/login-register/view/mobile/register_mobile_view.dart';

import '../../../core/utils/app_colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

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
          smallScreen: RegisterMobileView(),
        ),
      ),
    );
  }
}
