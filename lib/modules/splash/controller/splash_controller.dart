import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 4), () {
      onNext();
    });
    super.onInit();
  }

  void onNext() {
    Get.toNamed(Routes.ONBOARDING);
  }
}
