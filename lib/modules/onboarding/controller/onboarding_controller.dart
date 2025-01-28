import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';

import '../../../routes/app_routes.dart';

enum PageSequence { first, second, third }

class OnboardingController extends GetxController {
  var isPage = PageSequence.first.obs;

  void nextPage() {
    switch (isPage.value) {
      case PageSequence.first:
        isPage.value = PageSequence.second;
        break;
      case PageSequence.second:
        isPage.value = PageSequence.third;
        break;
      case PageSequence.third:
        Get.toNamed(Routes.LOGIN);
        break;
    }
  }

  Map<String, dynamic> getPageDetails() {
    switch (isPage.value) {
      case PageSequence.first:
        return {
          'image': kSvgAppOnboarding1,
          'text': 'Trade like a pro!',
          'description':
              'Grow your investments with Treyd trading tools built for you.',
        };
      case PageSequence.second:
        return {
          'image': kSvgAppOnboarding2,
          'text': 'Secured & Reliable',
          'description':
              'Grow your investments with Treyd trading tools built for you.',
        };
      case PageSequence.third:
        return {
          'image': kSvgAppOnboarding3,
          'text': 'Start Growing',
          'description':
              'Grow your investments with Treyd trading tools built for you.',
        };
      default:
        return {};
    }
  }
}
