import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';
import 'package:treyd_crypto/core/utils/app_colors.dart';
import 'package:treyd_crypto/modules/splash/controller/splash_controller.dart';

class SplashMobileView extends StatelessWidget {
  const SplashMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: buildBody(controller, context),
          );
        });
  }
}

Widget buildBody(SplashController controller, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SvgPicture.asset(
          kSvgAppLogo,
          fit: BoxFit.scaleDown,
        ),
      ),
    ],
  );
}
