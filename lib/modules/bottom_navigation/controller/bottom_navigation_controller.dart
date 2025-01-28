import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController with _Initializer {
  final PageController pageController = PageController();
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  GlobalKey scaffoldkey = GlobalKey();
  void goTap(int index) {
    if (currentIndex.value != index) {
      switch (index) {
        case 0:
          pageController.jumpToPage(0);
          break;
        case 1:
          pageController.jumpToPage(1);
          break;
        case 2:
          pageController.jumpToPage(2);
          break;
        case 3:
          pageController.jumpToPage(3);
          break;
      // case 0:
      //   navigateTo(Routes.HOME);
      //   break;
      // case 1:
      //   navigateTo(Routes.VEHICLES);
      //   break;
      // case 2:
      //   navigateTo(Routes.PARKING_HISTORY);
      //   break;
      // case 3:
      //   navigateTo(Routes.PROFILE);
      //   break;

        default:
          pageController.jumpToPage(0);
          break;
      }
      currentIndex.value = index;
    }
  }
}

mixin _Initializer {
  final currentIndex = 0.obs;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
